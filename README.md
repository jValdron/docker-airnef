# docker-airnef

A basic docker file for Airnef. Tested with Canon Rebel T6i. "Connect to smartphone" then airnef connects to camera and download new photos, quick way to sync from Wifi.

Example:
```
docker run -d \
        --name vvintan0 \
        --restart always \
        -e IPADDRESS="<ip to cam>" \
        --name vvintan0 \
        -v /mnt/photos/Syncs/Camera:/output \
        -v /etc/airnef:/opt/airnef/appdata \
        jvaldron/docker-airnef
```
