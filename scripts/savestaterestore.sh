#!/bin/bash
rclone -q --include "*.{sra,srm,state,eep}" copy gdrive:retropie_saves/ /home/pi/RetroPie/roms/
