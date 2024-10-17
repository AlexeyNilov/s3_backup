#!/usr/bin/env bash

# cd /home/ec2-user/
# git clone https://github.com/AlexeyNilov/s3_backup.git

cd /home/ec2-user/s3_backup
python3.11 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cp conf/settings.py.sample conf/settings.py

sudo cp -f infra/backup_to_s3.service /etc/systemd/system/
sudo cp -f infra/backup_to_s3.timer /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable backup_to_s3.service
sudo systemctl enable backup_to_s3.timer
