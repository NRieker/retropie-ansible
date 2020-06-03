#!/bin/bash
rclone -q copy gdrive:saves/ /home/pi/RetroPie/saves/
rclone -q copy gdrive:states/ /home/pi/RetroPie/states/
