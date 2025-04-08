#!/bin/bash

echo "Setting up a local venv ..."
python3 -m venv searchies_venv
source searchies_venv/bin/activate
pip3 install -r requirements.txt

echo "All setup :)" && exit 0
