@echo off
REM Rebuild AXI3 adapter test project from scratch
REM Run from: cmd /c rebuild_axi3.bat

set VIVADO=C:\AMDDesignTools\2025.2\Vivado\bin\vivado.bat
set TCL=%~dp0create_project_axi3.tcl

echo [axiZero] Removing stale project...
if exist "%~dp0axizero_arty_axi3" rmdir /s /q "%~dp0axizero_arty_axi3"

echo [axiZero] Running Vivado create_project_axi3.tcl ...
"%VIVADO%" -mode batch -source "%TCL%" -log "%~dp0create_axi3.log" -journal "%~dp0create_axi3.jou"

echo [axiZero] Done. Exit code: %ERRORLEVEL%
