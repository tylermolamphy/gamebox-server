### A crude, opinionated image display controller for the Raspberry Pi

We use this to display our combat maps during our dungeons and dragons campaign. You could use it to display whatever image you'd like through the HDMI port on the Pi without running X.org or Wayland.

gamebox-server is written in Python using [Flask](https://pythonbasics.org/what-is-flask-python/), and served by [Gunicorn](https://gunicorn.org/) behind [nginx](http://nginx.org/en/). Under the good, it uses (fbi)[https://www.kraxel.org/blog/linux/fbida/] to display your image on the framebuffer console.

I run this on [DietPi](https://dietpi.com/docs/) but [Raspbian](https://www.raspberrypi.com/software/operating-systems/) should work fine.

#### Get started:

- Clone repo to /opt
- Run `bootstrap.sh` to install dependancies, tested on Raspbian 11 (bullseye)
- Symlink /etc/nginx/sites-enabled to repo/sites-available
- Start repo/scripts/init.sh on boot
