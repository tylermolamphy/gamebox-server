
<div align="center">
<img src="https://github.com/tylermolamphy/gamebox-server/raw/main/d20.png" height="350px"/>
</div><br><br>

#### gamebox-server is a homebaked web controller for displaying an image on a Raspberry Pi

I cobbled this together in Python using [Flask](https://github.com/pallets/flask/#readme). It calls scripts that trigger [fbi](https://www.kraxel.org/blog/linux/fbida/) to display your image on the host's framebuffer console.

We use this to display our combat maps during our dungeons and dragons campaign. You could use it to display whatever image you'd like through the HDMI port on the Pi without running X.org or Wayland.

I host this on a Pi 3B+ with [Gunicorn](https://gunicorn.org/) behind [nginx](https://nginx.org/en/) on [DietPi](https://dietpi.com/docs/).

If you want to as well, clone this repository to /opt and run:

`bash scripts/bootstrap.sh`
