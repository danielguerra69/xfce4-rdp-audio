## Ubuntu Trusty Xfce4 Remote Desktop 


Ubuntu xrdp with working audio + clipboard.

The following applications have been preinstalled:

Xrdp, Remote desktop protol server
Xfce4, light weight desktop
Firefox with flash plugin, web browser
Audacious, winamp audio player
Vlc, video for linux media/video player
Gnome mplayer, media/video player


# Usage

Run the server

```bash
docker run -d --name xfce4 --shm-size 1g -p 3389:3389 danielguerra/xfce4-rdp-audio
```
*note 
	--shm-size 1g is for firefox shared memory needs (you can use m for Mb and g for Gb)


The rdp server listens to port 3389.

If you have an other rdp server on port 3389 use -p 3389 or -p <my-docker-rdp-port>:3389

Check your container
```bash
docker ps | grep xfce4
```




Connect with client

Connect with your favorite remote desktop client to

<docker-ip> <my-docker-rdp-port>