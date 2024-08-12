# Debian Shell Scripts

This repository consists of Debian Shell Scripts several processes

**To use these scripts you must install Curl in first hand**
```
sudo apt install curl -y
```

- # Proxmox Inital Setup Script - Proxmox-Setup.sh

	- Prerequisites
		navigate to Datacenter -> storage and remove local-lvm
			
	-  Execute the following command to initialize the Proxmox-Setup Script
```
curl -fsSL https://raw.githubusercontent.com/naveenvarmaofficial/Deb-Scripts/main/proxmox-setup.sh | sudo bash
```

This script executes the below mentioned tasks
- Combines the unallocated space (removed from local-lvm) in disk and merge it to local disk 
- Installs git and wget
- Configures the system to not shutdown after the lid is closed (For laptops)
- Configure the system to not shutdown in docked state (For laptops)
- Configure the system's monitor to sleep after 5 mins to reduce power consumption and display damage

- # Docker Install script - docker-install.sh

	- Execute the following command to install docker
```
curl -fsSL https://raw.githubusercontent.com/naveenvarmaofficial/Deb-Scripts/main/docker-install.sh | sudo bash
```

This script installs the list of applications in order to run Docker properly
- Docker-CE
- Docker-CE-CLI
- Containerd.io
- Docker-Compose
- Docker-Compose-Plugins

> **_NOTE:_** Remove "sudo" from the command, Since sudo is not recognized in Proxmox LXC containers
