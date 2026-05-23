#!/bin/bash
# Move to the deployment target directory
cd /home/ec2-user/app

# Create a clean Python virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment and install dependencies
source venv/bin/activate
pip install -r requirements.txt

# Safely kill any existing Gunicorn instance running on port 8000 to avoid port conflicts
sudo pkill gunicorn || true

# Spin up Gunicorn in detached mode, binding to port 8000
nohup gunicorn -w 3 -b 0.0.0.0:8000 app:app > gunicorn.log 2>&1 &