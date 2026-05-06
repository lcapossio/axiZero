# Copyright (c) 2026 Leonardo Capossio - bard0 design  hello@bard0.com
# SPDX-License-Identifier: MIT

proc add_fcapz_debug_sources {script_dir} {
    set repo_root [file normalize [file join $script_dir .. .. ..]]
    set fcapz_root [file join $repo_root fcapz]
    if {![file isdirectory $fcapz_root]} {
        error "fcapz submodule is missing at $fcapz_root"
    }

    add_files -norecurse [list \
        $fcapz_root/rtl/fcapz_version.vh \
        $fcapz_root/rtl/reset_sync.v \
        $fcapz_root/rtl/dpram.v \
        $fcapz_root/rtl/trig_compare.v \
        $fcapz_root/rtl/fcapz_ela.v \
        $fcapz_root/rtl/fcapz_ela_xilinx7.v \
        $fcapz_root/rtl/jtag_reg_iface.v \
        $fcapz_root/rtl/jtag_pipe_iface.v \
        $fcapz_root/rtl/jtag_burst_read.v \
        $fcapz_root/rtl/jtag_tap/jtag_tap_xilinx7.v \
        $fcapz_root/rtl/fcapz_async_fifo.v \
        $fcapz_root/rtl/fcapz_ejtagaxi.v \
        $fcapz_root/rtl/fcapz_ejtagaxi_xilinx7.v \
        $script_dir/ip/rtl/axizero_fcapz_debug.v \
    ]
    set_property file_type "Verilog Header" [get_files fcapz_version.vh]
    set_property is_global_include true [get_files fcapz_version.vh]
    set_property file_type {Verilog} [get_files axizero_fcapz_debug.v]
}

proc disconnect_matching_bd_pins {pattern} {
    foreach pin [get_bd_pins -quiet $pattern] {
        foreach net [get_bd_nets -quiet -of_objects $pin] {
            catch { disconnect_bd_net $net $pin }
        }
    }
}

proc fcapz_connect_pin {a b} {
    set pa [get_bd_pins -quiet $a]
    set pb [get_bd_pins -quiet $b]
    if {$pa eq "" || $pb eq ""} {
        error "missing BD pin while connecting $a to $b"
    }
    connect_bd_net $pa $pb
}

proc fcapz_find_free_axi_ingress {} {
    set best_idx -1
    set best_name ""
    foreach pin [get_bd_pins -quiet axizero_0/s*_axi_awvalid] {
        set pin_name [get_property NAME $pin]
        if {![regexp {^s([0-9]+)_axi_awvalid$} $pin_name -> idx]} {
            continue
        }
        if {[get_bd_nets -quiet -of_objects $pin] ne ""} {
            continue
        }
        if {$idx > $best_idx} {
            set best_idx $idx
            set best_name [format "s%d_axi" $idx]
        }
    }
    return $best_name
}

proc connect_fcapz_arty_debug {} {
    create_bd_cell -type module -reference axizero_fcapz_debug fcapz_debug_0
    connect_bd_net [get_bd_ports sys_clk] [get_bd_pins fcapz_debug_0/aclk]
    connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins fcapz_debug_0/aresetn]

    set ingress [fcapz_find_free_axi_ingress]
    if {$ingress eq ""} {
        puts "\[fcapz\] no free axizero_0/s*_axi ingress; USER4 EJTAG-AXI is left unconnected."
        return
    }

    puts "\[fcapz\] connecting USER4 EJTAG-AXI to dedicated axizero_0/$ingress ingress"
    fcapz_connect_pin fcapz_debug_0/m_axi_awvalid axizero_0/${ingress}_awvalid
    fcapz_connect_pin axizero_0/${ingress}_awready fcapz_debug_0/m_axi_awready
    fcapz_connect_pin fcapz_debug_0/m_axi_awaddr  axizero_0/${ingress}_awaddr
    fcapz_connect_pin fcapz_debug_0/m_axi_awprot  axizero_0/${ingress}_awprot
    fcapz_connect_pin fcapz_debug_0/m_axi_wvalid  axizero_0/${ingress}_wvalid
    fcapz_connect_pin axizero_0/${ingress}_wready fcapz_debug_0/m_axi_wready
    fcapz_connect_pin fcapz_debug_0/m_axi_wdata   axizero_0/${ingress}_wdata
    fcapz_connect_pin fcapz_debug_0/m_axi_wstrb   axizero_0/${ingress}_wstrb
    fcapz_connect_pin axizero_0/${ingress}_bvalid fcapz_debug_0/m_axi_bvalid
    fcapz_connect_pin fcapz_debug_0/m_axi_bready  axizero_0/${ingress}_bready
    fcapz_connect_pin axizero_0/${ingress}_bresp  fcapz_debug_0/m_axi_bresp
    fcapz_connect_pin fcapz_debug_0/m_axi_arvalid axizero_0/${ingress}_arvalid
    fcapz_connect_pin axizero_0/${ingress}_arready fcapz_debug_0/m_axi_arready
    fcapz_connect_pin fcapz_debug_0/m_axi_araddr  axizero_0/${ingress}_araddr
    fcapz_connect_pin fcapz_debug_0/m_axi_arprot  axizero_0/${ingress}_arprot
    fcapz_connect_pin axizero_0/${ingress}_rvalid fcapz_debug_0/m_axi_rvalid
    fcapz_connect_pin fcapz_debug_0/m_axi_rready  axizero_0/${ingress}_rready
    fcapz_connect_pin axizero_0/${ingress}_rdata  fcapz_debug_0/m_axi_rdata
    fcapz_connect_pin axizero_0/${ingress}_rresp  fcapz_debug_0/m_axi_rresp
    fcapz_connect_pin axizero_0/${ingress}_rvalid fcapz_debug_0/m_axi_rlast
}
