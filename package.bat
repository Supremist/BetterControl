set MOD_DIR=package\bin\x64\plugins\cyber_engine_tweaks\mods\BetterControl
set INPUT_DIR=package\r6\input

rmdir /s /q package
md %MOD_DIR%
md %INPUT_DIR%
copy init.lua %MOD_DIR%
copy BetterControl.xml %INPUT_DIR%