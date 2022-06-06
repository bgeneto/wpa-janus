# wpa-janus

This is a Janus WebRTC server Docker image prepared for World Pendulum Alliance (WPA) usage with the [FREE_Web](https://github.com/e-lab-FREE/FREE_Web/blob/master/README.md) framework.

## Install procedure

Just clone this repo in the directory of your choice:

```bash
cd /opt/docker
git clone https://github.com/bgeneto/wpa-janus.git
cd wpa-janus
docker compose up
```

## Configure streams 

Just edit the file `config/janus.plugin.streaming.jcfg` in order to add/delete/change streams, ports etc...


Don't forget to change the `admin_secret` in the `config/janus.jcfg` file and the `admin_key` and `rtp_port_range` in `config/janus.plugin.streaming.jcfg`.
