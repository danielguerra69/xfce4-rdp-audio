FROM danielguerra/dockergui

#########################################
##        ENVIRONMENTAL CONFIG         ##
#########################################

# Set environment variables

# User/Group Id gui app will be executed as default are 99 and 100
ENV USER_ID=99
ENV GROUP_ID=100

# Gui App Name default is "GUI_APPLICATION"
ENV APP_NAME FIREFOX

# Default resolution, change if you like
ENV WIDTH=1280
ENV HEIGHT=720

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
##    REPOSITORIES AND DEPENDENCIES    ##
#########################################

RUN add-apt-repository ppa:nilarimogard/webupd8
RUN apt-get update

# Install packages needed for app

#########################################
##          GUI APP INSTALL            ##
#########################################
ENV DEBIAN_FRONTEND noninteractive
# Install steps for X app
RUN apt-get -yy install xfce4 xfce4-terminal browser-plugin-freshplayer-pepperflash firefox
RUN apt-get -yy install xfce4-artwork xfce4-mixer xfce4-radio-plugin xfce4-volumed mplayer \ 
    gstreamer0.10-pulseaudio gnome-mplayer vlc vlc-plugin-pulse pulseaudio-equalizer audacious \
    audacious-plugins gnome-icon-theme-full && \
    rm -rf /var/cache/apk/*
RUN sed -i -e 's/\/usr\/bin\/openbox-session/\/usr\/bin\/xfce4-session/' /etc/service/openbox/run
RUN rm -rf /etc/service/xclipboard/
WORKDIR /nobody
# Copy X app start script to right location
COPY startapp.sh /startapp.sh

#########################################
##         EXPORTS AND VOLUMES         ##
#########################################

# Place whater volumes and ports you want exposed here: