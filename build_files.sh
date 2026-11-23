#!/bin/bash
set -e

echo "==> Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "==> Installing requirements..."
pip install -r requirements.txt

echo "==> Collecting static files..."
python3 manage.py collectstatic --noinput --clear

echo "==> Copying media files..."
mkdir -p staticfiles_build/media
cp -r media_root/* staticfiles_build/media/ || true

echo "==> Build completed successfully!"
