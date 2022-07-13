# host:
- cloned mac address property set using nmcli
- device set using nmtui

# docker-comose using all images:
- docker-compose up -d
- The github actions workflow for various images are working and any push to repos should create corresponding images in suryatel org in docker hub.
- A simple docker pull suryatel/hm-diag etc should suffice to udpate the image.
- hm-pyhelper is being tracked as latest from all images.


# working on host build so that we can move to a single build.
- systemd files will be best to start working on that.
- single build is being worked on under helium-one
- the .venv is outside though /opt/.venv

```
sudo apt install python3-venv
sudo mkdir /opt/.venv
sudo chown -R rock:rock /opt/.venv

python3 -m venv /opt/.venv
source /opt/.venv/bin/activate

cd hm-one
pip install --upgrade pip
pip install -r requirements.txt
pip install -e ../hm-diag
pip install -e ../hm-pyhelper
```

- copy hm-config files. remove old stale links

```
sudo rm /opt/lib
sudo rm /opt/gatewayconfig
sudo ln -s ../hm-config/lib /opt/lib
sudo ln -s ../hm-config/gatewayconfig /opt/
sudo cp ../hm-config/start-gateway-config.sh /opt/
```

# copy hm-pktfwd files
- compile lora_gateway for sx1301 lora pkt forwarder
```
cd ~/miner/lora_gateway
bash compile_libloragw.sh
```
- copy reset_lgw.sh  start-gateway-config.sh  sx1301  sx1302 from hm-pktfwd container, you might have to compile them.
- compile sx1301 hal pkt forwarder and copy files

- compile sx1302 and copy files
```
cd ~/miner/sx1302_hal
sudo bash compile.sh
sudo cp -rfp ./build /opt/sx1302
```

# install pktfwd and services
```
sudo rm /opt/pktfwd
sudo ln -s ../hm-pktfwd/pktfwd /opt/

sudo cp *.service /lib/systemd/system/
sudo systemctl enable hm-config.service
sudo systemctl enable hm-diag.service 
sudo systemctl enable pkt-fwd.service
```