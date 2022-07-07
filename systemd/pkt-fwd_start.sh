export ROOT_DIR=/opt

# Copy from: Locations of build assets within images of earlier stages
export SX1301_PACKET_FORWARDER_OUTPUT_DIR=/opt/output
export SX1302_HAL_OUTPUT_DIR=/opt/output
export PKTFWD_BUILDER_OUTPUT_DIR=/opt/output/pktfwd-dependencies

# Copy to: Locations build assets from earlier stages/source are copied into
export SX1301_DIR="$ROOT_DIR/sx1301"
export SX1302_DIR="$ROOT_DIR/sx1302"
export PYTHON_APP_DIR="$ROOT_DIR/pktfwd"
export PYTHON_DEPENDENCIES_DIR="$ROOT_DIR/pktfwd-dependencies"
export SX1301_RESET_LGW_FILEPATH="$SX1301_DIR/reset_lgw.sh"

# Variables required for pktfwd python app
export SX1301_REGION_CONFIGS_DIR="$PYTHON_APP_DIR/config/lora_templates_sx1301"
export SX1302_REGION_CONFIGS_DIR="$PYTHON_APP_DIR/config/lora_templates_sx1302"
export SX1302_LORA_PKT_FWD_FILEPATH="$SX1302_DIR/lora_pkt_fwd"
export UTIL_CHIP_ID_FILEPATH="$SX1302_DIR/chip_id"
# The sx1302_hal concentrator script requires reset_lgw to be in this location
export RESET_LGW_FILEPATH="$ROOT_DIR/reset_lgw.sh"

cd $ROOT_DIR

# Run pktfwd/__main__.py
source $ROOT_DIR/.venv/bin/activate
python3 pktfwd

cd -