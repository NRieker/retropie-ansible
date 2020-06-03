#!/bin/bash
rclone -q -u copy gdrive:saves/ /home/pi/RetroPie/saves/
rclone -q -u copy gdrive:states/ /home/pi/RetroPie/states/
