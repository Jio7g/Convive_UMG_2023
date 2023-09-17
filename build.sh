#!/usr/bin/env bash
# exit on error
set -o errexit

# poetry install
pip install --upgrade pip
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Ejecuta el comando para crear un superusuario
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('ConviveAdmin', ' ', 'UMG_2023')" | python manage.py shell
