FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y dbus-x11 && \
    apt-get install -y sudo && \
    apt-get install -y bash && \
    apt-get install -y net-tools && \
    apt-get install -y novnc && \
    apt-get install -y x11vnc && \
    apt-get install -y xvfb && \
    apt-get install -y supervisor && \
    apt-get install -y xfce4 && \
    apt-get install -y gnome-shell && \
    apt-get install -y ubuntu-gnome-desktop && \
    apt-get install -y gnome-session && \
    apt-get install -y gdm3 && \
    apt-get install -y tasksel && \
    apt-get install -y ssh && \
    apt-get install -y terminator && \
    apt-get install -y git && \
    apt-get install -y nano && \
    apt-get install -y curl && \
    apt-get install -y wget && \
    apt-get install -y zip && \
    apt-get install -y unzip && \
    apt-get install -y falkon && \
    apt-get autoclean -y && \
    apt-get autoremove -y


COPY novnc.zip /novnc.zip
COPY . /system

RUN unzip -o /novnc.zip -d /usr/share
RUN rm /novnc.zip

RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
