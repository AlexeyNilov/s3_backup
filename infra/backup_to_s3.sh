#!/usr/bin/env bash

cd /home/ec2-user/s3_backup/
source .venv/bin/activate
PYTHONPATH=${PYTHONPATH}:. python data/backup_db.py
