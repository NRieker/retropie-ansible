#!/bin/bash
rclone -q --include "*.{sra,srm,state,eep}" copy gdrive:roms/ /home/pi/RetroPie/roms/
