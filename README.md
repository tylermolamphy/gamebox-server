### A crude, opinionated image display controller for the Raspberry Pi

We use this to display our combat maps during our dungeons and dragons campaign. You could use it to display whatever image you'd like through the HDMI port on the Pi without running X.org or Wayland.

gamebox-server is written in Python using [Flask](https://github.com/pallets/flask/#readme), using (fbi)[https://www.kraxel.org/blog/linux/fbida/] to display your image on the host's framebuffer console.

I host this with [Gunicorn](https://gunicorn.org/) behind [nginx](https://nginx.org/en/) on [DietPi](https://dietpi.com/docs/).

#### Get started:

On a fresh, configured DietPi installation, clone this repository to /opt and run `bash scripts/bootstrap.sh`
