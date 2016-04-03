# ML Vagrant Devbox

## Features
- Simple administration. No steep learning curve like Puppet or Chef. Instead, it uses a simple shell script to install packages and import the database (Standard database will be added in the next release).
- VM Description
	- 1/4 Of System Memory RAM (OSX and Unix)
	- 4 Gb fix on Windows Machines
	- Ubuntu 14.04 LTS (trusty)
	- Vagrant Hostmanager for friendly URL´s
	- Nginx Server with predefined Serverblocks
	- Mongo Db (With Mongo Admin Gui Preinstalled and configured)
	- Node Js (latest)
	- [MailCatcher](http://mailcatcher.me/)
	- Setupscript for easy deployment

## Setup
First you have to set some Variables via the setup script. Open a terminal in the Project root and Type:
'sh scripts/setup.sh'
Type in the IP (matching your network ex. 192.168.0.100), desired Hostname of your Machine, and your development Url (ex. meanbox.dev).

These folders are used as follows:
- www
	- This is the web root of your Machine. It is mapped to /var/www 
- scripts
	- Contains all the nessesary scripts to setup the Vagrant Machine

## What is the bootstrap.sh script doing?
- This file is only run when the virtual machine is initially created or recreated after a `vagrant destroy`

## What is the load.sh script doing?
- This file is run every time the virtual machine is started from a `vagrant up`
- It starts the mongodb Server and all preinstalled helpers as Deamons

## Using MailCatcher
- Load [http://<selected url>:1080/](http://192.168.56.101:1080/) in your browser to view the MailCatcher interface
