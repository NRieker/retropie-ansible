# retropie-ansible

## Summary

This project's purpose is to add pre and post-configuration automation to one or more Raspberry Pi's running RetroPie using Ansible in an infrastructure-as-code manner.

## Why

The [RetroPie](https://github.com/RetroPie) team has done an incredible job of creating a simple process to setup multiple emulators on a Raspberry Pi. They've also created pre-built images which simplify the setup even further. This project adds additional post-configuration automation such as joystick configurations, cloud saves, etc. Plus, Ansible is awesome!

## Usage

This project assumes that your Raspberry Pi already exists within your ''/etc/ansible/hosts'' inventory file and is accessible via SSH.  The playbooks will run against all hosts but you can change that to your own group in your local repository.  I've tested this on Raspberry Pi 4's running Raspbian Lite and RetroPie 4.6, but this would likely work on other models and versions.

### Pre-configuration

The ''pre-configuration.yml'' playbook is intended to be run prior to RetroPie install, although it could also be run afterwards to keep Rasbian packages and the RetroPie-Setup script updated.

Pre-configuration playbook overview:
- Update and upgrade Raspbian packages
- Disable overscan and force HDMI hotplug
- Install Rclone for cloud saves
- Download the latest RetroPie-Setup repository

### RetroPie Installation

The [RetroPie installation](https://github.com/RetroPie/RetroPie-Setup/wiki/Manual-Installation#install-retropie) is not covered within these playbooks as there are too many variables and depencies to consider. It's left to the user's discresion as to what cores will be installed. I recommend enabling Emulationstation autostart from within the setup script.

### Post-configuration



### Cloud Saves

