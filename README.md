#eRegister

Prerequisites 
To provide technical assistance the system requires that you have the following software installed on your computer:
1.	WinSCP - WinSCP is a free and open-source SSH File Transfer Protocol, File Transfer Protocol, WebDAV, Amazon S3, and secure copy protocol client for Microsoft Windows. Its main function is secure file transfer between a local computer and a remote server.
Download site - https://winscp.net/eng/download.php
2.	Putty - PuTTY is a free and open-source terminal emulator, serial console and network file transfer application. It supports several network protocols, including SCP, SSH, Telnet, rlogin, and raw socket connection. It can also connect to a serial port. The name "PuTTY" has no official meaning.
Download site - https://www.putty.org/
3.	Basic Linux/Unix Skill.
4.	An android gadget (Tablet, mobile phone, etc.).

Installation
1.	On your android tablets navigate to your web browsing software (Chrome, internet, etc.), in the URL type of copy and paste the following URL where an updated Termux software is. 
	https://f-droid.org/en/packages/com.termux/

The one found on the google PlayStore has no support. 
2.	Navigate to the gadgets file manage to find the downloaded APK file from f-droid. If the gadget doesn’t allow you to install apps from unknown sources here is how you allow.
a.	Open your Android's Settings app. The Settings icon looks like a gray gear or wrench icon on your Apps list.

 
b.	Scroll down and tap Security. This menu will let you customize your device's privacy, password, and administration settings  
On some devices, this option may be titled Lock Screen & Security.

 
c.	Check the box next to Unknown Sources. Turning this option on will let you install apps on your device from sources other than the Play Store. You will have to confirm your action in a pop-up box.
On some devices, you may need to slide a switch instead of checking a box. In this case, slide the Unknown Sources switch to On position.
d.	Tap OK to confirm. This will confirm your action and check the Unknown Sources box.
Now that you able to install apps from unknown sources, install termux apk file you. After that you can set the settings back to default that doesn’t allow the installation from unknown sources.
3.	Open or navigate and find termux on your gadget, 
 
By now you should be wondering what termux is. Well, Termux is an Android terminal emulator and Linux environment app that works directly with no rooting or setup required. A minimal base system is installed automatically - additional packages are available using the APT package manager.
You will need the following packages installed in termux to successfully have the objective met.
a.	MySQL
b.	PHP 
c.	PhpMyAdmin
d.	Tmate
e.	openssh
To install any of the packages, you run the apt package manager, for example.
	apt install mysql
But wait, for all these packages to be installed you need to update the Linux environment, this requires that your gadget is connected to the internet. Here is how you do it. 
i.	$ apt update
 
ii.	$ apt upgrade
you will be asked if you want to proceed with the upgrade, Yes (Y) should your answer
 
4.	Now that the installation of the upgrade is complete, lets proceed with the installation of the required packages.
$ apt install openssh – SSH for remote secure access to the linux environment.
$ sshd - After installation enable SSH by typing $ sshd
 
I have already installed it; you will be asked to install by typing (Y). 

What is openSSH? OpenSSH is a suite of secure networking utilities based on the Secure Shell protocol, which provides a secure channel over an unsecured network in a client–server architecture. OpenSSH started as a fork of the free SSH program developed by Tatu Ylönen; later versions of Ylönen's SSH were proprietary software offered by SSH Communications Security

Enable user log in by giving user a password, by default, the password you give will be the user, unless you decide to change the user yourself in the sshd_config.conf file.
$ passwd
 

By now you can remotely login with the user and password using putty or WinSCP.
You can continue with the installation of the packages on the gadget or remotely using putty. Whatever method you choose will work out. 

The recommendation is that you use putty because its faster when to comes to copy paste. WinSCP on the hand is for file transfer with easy. 

For one to be able to successfully login remotely, you will need to be on the same network with the laptop or computer you are using with the android gadget. You must be on the same domain. 


In termux ssh, the default port is 8022 
 

In your termux command line type 
$ ip address - to get the ip at the bottom of the screen. 
My example IP - 172.20. 10.2
PORT # - 8022
File protocol – SFTP
Username – 1234
Password – 1234

A successful login will take you the home directory. 
 
Here you can navigate between directories and edit files if you can. If you want to switch to putty, you can click the icon as indicated below or connect using putty just like we have done with WinSCP.


A successful login will take you to your home directory just like WinSCP but this time using command line. 
5.	Installing packages

$ apt install apache2 php php-apache mariadb phpMyAdmin
 

This command will install all the packages, a good time to have a cup of coffee. It will take some time depending on your internet connection. 
For this exercise, you will need to navigate to the following directory to update the config files.

a.	/data/data/com.termux/files/usr/etc/apache2 - Replace the httpd.conf with the one shared. 
b.	/data/data/com.termux/files/usr/etc/apache2/extra - Replace the httpd_vhost.conf with the one shared. 
c.	/data/data/com.termux/files/home - upload the .bash_profile for auto startup of the packages
d.	/data/data/com.termux/files/usr/lib- Upload the php.ini file in this directory for php configs changes.

If you have skills on how to setup apache, you can update things as you wish. The shared files have already configured phpMyAdmin, php and other relevant configs for plug and play


6.	Starting the environment 
After replacing the files, if apache2 was running stop it by doing
	$ killall httpd
Start if by running 
	$ httpd
 
create a file in extra directory using the following command
$ touch /data/data/com.termux/files/usr/etc/apache2/extra/php_module.conf
Starting up mysql
$ mysqld --skip-grant-tables --general-log &
Stopping mysql 
$ killall mysqld


7.	Loading the app. 
Now that the environment is set, its time to upload the e-Register application
The directory where the php files sits, sometimes called the www folder is below
/data/data/com.termux/files/usr/share/apache2/default-site/htdocs
 
On the left of the WinSCP software is the local directory where the shared files are sitting, and the right side is the android gadget directory. Move the files by drug and drop on either side depending on where you want to move the file.
Unzip the eregister.zip after upload in WinSCP now using putty. 
$ unzip eregister.zip
 
This will unzip the folder, 
Update the ewcfg.php in the register directory to connect to the database on the following line 220 and 223
	// Database connection info
	"CONNECTION_INFO" => [
		"DB" => ["id" => "DB", "type" => "MYSQL", "qs" => "`", "qe" => "`", "host" => "localhost", "port" => "3306", "user" => "root", "pass" => "root", "db" => "hf_register"]
	],
	"PRODUCTION_CONNECTION_INFO" => [
		"DB" => ["id" => "DB", "type" => "MYSQL", "qs" => "`", "qe" => "`", "host" => "localhost", "port" => "3306", "user" => "root", "pass" => "root", "db" => "hf_register"]
	],
By default the password will be empty. When you run the command 
$ mysqld --skip-grant-tables --general-log &
This will enable the password for MariaDB (MySQL) to root. The user will always be root.
If you have MySQL configuration knowledge, you will be able to update these details to something else.
8.	Restoring the Database
Remember that you can access the android tablet server even on your computer by using its IP. In my case the IP remains 172.20.10.2. in your computer web browser, navigate to the URL and type the following
“Your_gadgets_ip”:8080/phpMyAdmin
172.20.10.2:8080/phpmyadmin
 
A successful login will grant you GUI for the MySQL MariaDB

i.	Create a new database “hf_register” 

ii.	Once created, it will reflect on the left and will be the default selected.


iii.	Import the database shared with you by clicking the import button by browsing and navigate to the file and select open and finally GO at the bottom of the page. This will take a few minutes but should restore the database. 
 

If the import was successful, you will have the following page, with the success message 

9.	Accessing the register App.
On your browser if it’s the server android gadget
Your_ip:8080/eregister
172.20.10.2:8080/eregister
 
10.	We are done and you can proceed to the next session. 

