FROM debian:stable

# Config
ARG version=1.1
ARG source=http://www.testcams.com/airnef/Version_${version}/airnef_v${version}_Linux_Binary.tar.gz
VOLUME ["/output", "/opt/airnef/appdata"]
ENV IPADDRESS=auto
ENV REALTIMEDOWNLOAD=afternormal

# "Build"
WORKDIR /opt
ADD $source ./airnef.tar.gz
RUN tar -xf ./airnef.tar.gz

# Run
ENTRYPOINT /opt/airnef/airnefcmd --ipaddress $IPADDRESS --realtimedownload $REALTIMEDOWNLOAD --outputdir /output
