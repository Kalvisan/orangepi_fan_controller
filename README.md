# Orange Pi CPU controll script

### Setup WiringOP
First of all we need to install WiringOP command `gpio`. For controlling Orange PI build in GPIO pins.

WiringOP installation you can find here - https://github.com/zhaolei/WiringOP#installation

Installing WiringOP:

`$ git clone https://github.com/zhaolei/WiringOP.git -b h3`

`$ cd WiringOP`

`chmod +x ./build`

`sudo ./build`

### Setup script
For me script is inside `/root` directory. And script file name is `fan-controller.sh`.

First step is creating script file:

`$ sudo nano /root/fan-controller.sh` - for creating script inside /root folder

Paste my fan-controller.sh code inside your new created file.

`$ sudo chmod +x /root/fan-controller.sh` - for adding exacutable status to file

Now add fan controller script to crontab.

`$ sudo nano /etc/crontab` - open crontab file

And now at the bottom of file add line: `*/2 * * * * root bash /root/fan-controller.sh`

Now script will execute every 2 minutes and run our new created file `/root/fan-controller.sh`

### For more information

Information about `crontab` - http://www.adminschoice.com/crontab-quick-reference

Information about `gpio` - https://github.com/zhaolei/WiringOP
