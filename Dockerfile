FROM debian:stable

# Config
ARG version=1.1
ARG source=http://www.testcams.com/airnef/Version_${version}/airnef_v${version}_Linux_Binary.tar.gz
VOLUME ["/output", "/opt/airnef/appdata"]
ENV IPADDRESS=auto
ENV REALTIMEDOWNLOAD=afternormal

# "Build"
WORKDIR /opt
RUN apt update && apt install -y wget && rm -rf /var/lib/apt/lists/*
RUN wget --no-check-certificate $source
RUN tar -xf airnef_v${version}_Linux_Binary.tar.gz
RUN rm airnef_v${version}_Linux_Binary.tar.gz

# Run
ENTRYPOINT /opt/airnef/airnefcmd --ipaddress $IPADDRESS --realtimedownload $REALTIMEDOWNLOAD --outputdir /output
