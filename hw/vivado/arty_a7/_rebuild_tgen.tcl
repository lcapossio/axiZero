open_project C:/Projects/axiZero/hw/vivado/arty_a7/axizero_arty_qos_stress/axizero_arty_qos_stress.xpr

# Reset all synth runs (traffic gen RTL changed)
reset_run system_tgen_0_0_synth_1
reset_run system_tgen_1_0_synth_1
reset_run system_tgen_2_0_synth_1
reset_run synth_1
reset_run impl_1

# Re-launch OOC synth for the three traffic generators
launch_runs system_tgen_0_0_synth_1 system_tgen_1_0_synth_1 system_tgen_2_0_synth_1
wait_on_runs system_tgen_0_0_synth_1 system_tgen_1_0_synth_1 system_tgen_2_0_synth_1

# Top synth + impl + bitstream
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1

puts "\n[axiZero] Traffic gen rebuild complete - bitstream updated."
