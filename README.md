Firefox on a docker container with openconnect installed, nice for who wants to connect on a VPN without messing the local machine netword.

To allow connections on local x11:
```
xhost +local:root # everything is open
xhost -local:root && xhost +local:firefox-vpn # only the firefox container is able to connect
```

To execute the container
```
docker run -d -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name firefox-vpn --hostname firefox-vpn --privileged tiagodeoliveira/firefox-vpn
```

To setup the VPN:
```
$ docker exec -it firefox-vpn base 
$ openconnect --config=/etc/openconnect/openconnect.conf -b myvpn.com
```
