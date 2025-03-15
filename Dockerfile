FROM hoshinorei/l4d2server:sha-6810aca0f30162b05c42a220724ed92d8b854f7c
LABEL org.opencontainers.image.source=https://github.com/HoshinoRei/L4D2-Not0721Here-CoopSvPlugins
USER root
RUN apt update && \
    apt install -y rsync
USER steam
WORKDIR /home/steam/temp
COPY --chown=steam . ./
RUN rsync -r ./ /home/steam/l4d2server/left4dead2 && \
    rm -rf "/home/steam/temp"
WORKDIR /home/steam
CMD ["-secure", "+exec server.cfg", "+map c1m1_hotel", "-port 27015", "-tickrate 100"]
