# ML Vagrant Devbox

## Features
- Simple administration. This script doesn't require the learning curve of Puppet or Chef, though I recommend you looking into either of those solutions. Instead, it uses a simple shell script to install packages and import the database.
- VM Description
	- 1GB RAM
	- Ubuntu 14.04 LTS (trusty)
	- Apache w/ mod_rewrite
	- MySQL
	- PHP
	- [IoncubeLoader]()
	- [MailCatcher](http://mailcatcher.me/)
	- Setupscript for easy deployment

## Setup
The `Vagrantfile` shares 4 folders from your host machine into your VM: `./www`, `./sqldump`, `./scripts`, and `./custom_config/files`. If these folders don't exist they will be created when `vagrant up` is run. It is recommended to symlink folders from your current project to these in the vagrant folder and then you can change the symlinks to move between projects - e.g. `ln -fs ~/Sites/dev ./www`. You can do this either before or after `vagrant up`.

These folders are used as follows:
- www
	- This is the web root of the website you want hosted in the VM
- sqldump
	- This is where the database SQL file is stored. Initially it's fine for this to be empty, but if you destory the VM, a sqldump file located here will be imported into the VM's database when it is created. The file should be named `database.sql`
- scripts
	- There is a shell script file called `dumpdb.sh` located here. It can be run from within the vagrant machine (`vagrant ssh` to log in) in order to create a `database.sql` file which can be used for re-importing a database when creating the virtual machine.  You can locate any scripts here that you would like to have available within the virutal machine.
- custom_config_files
	- Inside of here, by default, is an apache2 directory containing the file `default`.  This file is the default virtual host file.  So you can alter it to align with your needs for the site you are attempting to host in the virtual machine.

## What is the bootstrap.sh script doing?
- This file is only run when the virtual machine is initially created or recreated after a `vagrant destroy`

## What is the load.sh script doing?
- This file is run every time the virtual machine is started from a `vagrant up`
- Imports `database.sql` into the `devdb` database if the file exists

## Using MailCatcher
- Load [http://192.168.56.101:1080/](http://192.168.56.101:1080/) in your browser to view the MailCatcher interface
