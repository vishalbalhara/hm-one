ROOT_DIR=/opt

# Copy from: Locations of build assets within images of earlier stages
SX1301_PACKET_FORWARDER_OUTPUT_DIR=/opt/output
SX1302_HAL_OUTPUT_DIR=/opt/output
PKTFWD_BUILDER_OUTPUT_DIR=/opt/output/pktfwd-dependencies

# Copy to: Locations build assets from earlier stages/source are copied into
SX1301_DIR="$ROOT_DIR/sx1301"
SX1302_DIR="$ROOT_DIR/sx1302"
PYTHON_APP_DIR="$ROOT_DIR/pktfwd"
PYTHON_DEPENDENCIES_DIR="$ROOT_DIR/pktfwd-dependencies"
SX1301_RESET_LGW_FILEPATH="$SX1301_DIR/reset_lgw.sh"

# Variables required for pktfwd python app
SX1301_REGION_CONFIGS_DIR="$PYTHON_APP_DIR/config/lora_templates_sx1301"
SX1302_REGION_CONFIGS_DIR="$PYTHON_APP_DIR/config/lora_templates_sx1302"
SX1302_LORA_PKT_FWD_FILEPATH="$SX1302_DIR/lora_pkt_fwd"
UTIL_CHIP_ID_FILEPATH="$SX1302_DIR/chip_id"
# The sx1302_hal concentrator script requires reset_lgw to be in this location
RESET_LGW_FILEPATH="$ROOT_DIR/reset_lgw.sh"

source $ROOT_DIR/.venv/bin/activate
export PYTHONPATH="${PYTHONPATH}:$ROOT_DIR"
cd $ROOT_DIR

# Run pktfwd/__main__.py
python3 pktfwd