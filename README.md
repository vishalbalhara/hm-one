host:
cloned mac address property set using nmcli
device set using nmtui

docker-comose using all images:
docker-compose up -d
the workflow for various images are working and any push to repos should create corresponing images in suryatel org in docker hub
a simple docker pull suryatel/hm-diag etc should suffice to udpate the image
hm-pyhelper is being tracked as latest from all images.


# working on host build so that we can move to a single build.
# systemd files will be best to start working on that.
# single build is being worked on under helium-one
# the .venv is outside though
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

# copy hm-config files
# remomve links before forming
sudo rm /opt/lib
sudo rm /opt/gatewayconfig

sudo ln -s ../hm-config/lib /opt/lib
sudo ln -s ../hm-config/gatewayconfig /opt/
sudo cp ../hm-config/start-gateway-config.sh /opt/

# copy hm-pktfwd files
copy reset_lgw.sh  start-gateway-config.sh  sx1301  sx1302 from hm-pktfwd container, you might have to compile them.
sudo ln -s ../hm-pktfwd/pktfwd /opt/

sudo cp *.service /lib/systemd/system/
sudo systemctl enable hm-config.service
sudo systemctl enable hm-diag.service 
sudo systemctl enable pkt-fwd.service