#! /bin/bash
cd /workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt

# Install Impact Pack and dependencies.
apt-get update && apt-get install libgl1
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git
cd ComfyUI-Impact-Pack
git submodule update --init --recursive
python install.py
cd ../..

# Download Juggernaut XL checkpoint
wget --content-disposition https://civitai.com/api/download/models/156005 -P ./models/checkpoints
# Download SDXL base VAE
wget --content-disposition https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0_0.9vae.safetensors \
-P ./models/vae

# Download SDXL refiner checkpoint
wget --content-disposition https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors \
-P ./models/checkpoints
# Download SDXL refiner VAE
wget --content-disposition https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0_0.9vae.safetensors \
-P ./models/vae
