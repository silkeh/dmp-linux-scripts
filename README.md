Introduction
===========
This is a collections of scripts that make the running of a [DarkMultiPlayer](https://github.com/godarklight/DarkMultiPlayer)
server more convenient.

The scripts include integration with *systemd*, but can also be run without.

These instructions assume you want to run a server named *career*,
installed in `/opt/dmp/career/` as user *jebediah*.
The folder and user can be configured in each file separately.

Installation
============
Make sure to install the dependencies. On Debian 8 this can be done with:

    sudo apt-get install mono-runtime libmono-system-core4.0-cil

Copy the service files to the `systemd` services folder:

    sudo cp dmp@.service dmp-screen@.service /etc/systemd/system/

Create the DarkMultiPlayer executables and configuration:

    sudo ./server-create.sh /opt/dmp/career

If required, change the config in `/opt/dmp/career/Config/Settings.txt`.

Running the server
==================

Running with systemd
--------------------
Two services are included:

 * `dmp@.service` is a simple systemd script that directly runs a server.
 * `dmp-screen@.service` runs a server inside a screen session so you can control it directly.

These commands can be substituded for one another in the instructions below.

To start the previously described *career* server:

    sudo systemctl start dmp@career

It can be stopped with:

    sudo systemctl stop dmp@career

You can enable a server at boot with:

    sudo systemctl enable dmp@career

Running without systemd
-----------------------
The commands that run (for a server named *career*) are:

    /usr/bin/mono /opt/dmp/career/DMPServer.exe

To stop it, the *mono* process needs to be killed.

To tun the service inside a screen:

    /usr/bin/screen -dmS dmp-career /usr/bin/mono /opt/dmp/career/DMPServer.exe

And to stop the screen session:

    sudo ./server-send.sh career /shutdown

To let *jebediah* run these commands at boot, add them to his crontab using an `@reboot` line.

Interacting with a server in a screen
=====================================

This only works when the server is run using the `dmp-screen@.service`.
These scripts also needs to be run as root, or as the user the server runs as.

Sending commands
----------------
A script to send commands is included, it works as follows:

    ./server-send.sh career hello universe

This only works when the server is run using the `dmp-screen@.service`.
It also needs to be run as root, or the user the server runs as.

Attaching
---------
To enter the screen directly, a script is included:

    ./server-attach.sh career

To detach, use `crtl+A D`

Updating the server
-------------------
Updating the server works exactly the same as installing it.

    sudo ./server-create.sh career

For `systemd` users a script is included that also stops the server, upates it and restarts it:

    sudo ./server-update.sh career
