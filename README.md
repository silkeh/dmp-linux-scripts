Installation
============
These instructions assume you want to install a server named `career`,
installed in `/opt/dmp/career/` as user `jebediah`.

Copy the service files to the `systemd` services folder:

    sudo cp dmp@.service dmp-screen@.service /etc/systemd/system/

Create the DarkMultiPlayer base config:

    sudo ./server-create.sh /opt/dmp/career

Now the server is ready, to run it use:

    sudo systemctl start dmp@career

Or, if you want to be able to send commands:

    sudo systemctl start dmp-screen@career

Sending commands
================
A script to send commands is included, it works as follows:

    ./server-send.sh career /help

This only works when the server is run using the `dmp-screen@.service`.
It also needs to be run as root, or the user the server runs as.

Updating the server
===================
Updating the server works exactly the same as installing it.
But for convenience a script is included that also stops the service:

    sudo ./server-update.sh career

