pip list --format=legacy --outdated | awk '{print $1}' | xargs pip install --upgrade
