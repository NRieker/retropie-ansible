#!/bin/bash
rclone -q -u copy /home/pi/RetroPie/saves/ gdrive:saves/
rclone -q -u copy /home/pi/RetroPie/states/ gdrive:states/
