
<div align="center">
<img src="d20.svg" height="350px"/>

## gamebox-server
</div>

### A crude, opinionated image display controller for the Raspberry Pi

gamebox-server is written in Python using [Flask](https://github.com/pallets/flask/#readme). It uses [fbi](https://www.kraxel.org/blog/linux/fbida/) to display your image on the host's framebuffer console.

We use this to display our combat maps during our dungeons and dragons campaign. You could use it to display whatever image you'd like through the HDMI port on the Pi without running X.org or Wayland.

I host this on a Pi 3B+ with [Gunicorn](https://gunicorn.org/) behind [nginx](https://nginx.org/en/) on [DietPi](https://dietpi.com/docs/). If you want to as well, clone this repository to /opt and run:

`bash scripts/bootstrap.sh`
