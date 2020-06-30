# retropie-ansible

## Summary

This project's purpose is to add pre and post-configuration automation to one or more Raspberry Pi's running RetroPie using Ansible in an infrastructure-as-code manner.

## Why

The [RetroPie](https://github.com/RetroPie) team has done an incredible job of creating a simple process to setup multiple emulators on a Raspberry Pi. They've also created pre-built images which simplify the setup even further. This project adds additional post-configuration automation such as joystick configurations, cloud saves, etc. Plus, Ansible is awesome!

## Usage

This project assumes that your Raspberry Pi already exists within your ``/etc/ansible/hosts`` inventory file and is accessible via SSH.  The playbooks will run against all hosts but you can change that to your own group in your local repository.  I've tested this on Raspberry Pi 4's running Raspbian Lite and RetroPie 4.6, but this would likely work on other models and versions.

### Pre-configuration

The ``pre-configuration.yml`` playbook will setup your Raspberry Pi for RetroPie installation. It's intended to be run prior to RetroPie install although it could also be run afterwards to keep Rasbian packages and the RetroPie-Setup script updated.

Pre-configuration playbook overview:
- Update and upgrade Raspbian packages
- Disable overscan and force HDMI hotplug
- Install Rclone for cloud saves
- Download the latest RetroPie-Setup repository

### RetroPie Installation

The [RetroPie installation](https://github.com/RetroPie/RetroPie-Setup/wiki/Manual-Installation#install-retropie) is not covered within these playbooks as there are too many variables and depencies to consider. It's left to the user's discresion as to what cores will be installed. I recommend enabling Emulationstation autostart from within the setup script.

### Post-configuration

The ``post-configuration.yml`` playbook is responsible for automating the RetroPie user configurations. I've initially included my own controller configurations but you can add yours by placing them in ``joypads/autoconfig`` and rerunning the playbook. Currently, this playbook doesn't copy ROM files as I'm still working through the appropiate way to do that as infrastructure-as-code.

Post-configuration playbook overview:
- Download this repository to your Raspberry Pi
- Copy joypad configurations
- Copy cloud save scripts
- Update save file and state locations

### Cloud Saves

There are numerous ways to implement cloud saves for RetroPie setups. I decided to go with a simple and widely available method for implementing cloud saves; [Rclone](https://rclone.org) with [Google Drive](https://drive.google.com). Using this method you can also sync your cloud saves with RetroArch on Android using [Autosync for Google Drive](https://play.google.com/store/apps/details?id=com.ttxapps.drivesync&hl=en_US)

#### Setup

On your Raspberry Pi run ``rclone config`` and follow the setup instruction in the [Rclone docs](https://rclone.org/drive/). Name your new rclone remote ``gdrive`` and create two folders in your Google Drive named ``saves`` and ``states`` to ensure compatibility with the cloud save scripts.

#### Usage

During every boot the cloud restore script (``save_file_auto_restore.sh``) uses the [Rclone copy](https://rclone.org/commands/rclone_copy/) command to copy your cloud saves to your Raspberry Pi, ignoring any cloud saves that are older than local saves. Upon exiting an emulator the cloud save script (``runcommand-onend.sh``) runs against the saves and states directories. To force a restore of cloud saves on the Raspberry Pi even if local saves are newer, run the ``save_file_force_restore.sh`` script from the RetroPie Runcommand User Menu.
