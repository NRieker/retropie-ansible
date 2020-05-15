#!/bin/bash
rclone -q --include "*.{sra,srm,state,eep}" copy /home/pi/RetroPie/roms/ gdrive:roms/