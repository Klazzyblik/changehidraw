#!/usr/bin/bash

# Inform the user about the purpose of the script
echo "This script will allow Chrome to access the hidraw path."
echo "Please run ./removechromehidraw.sh once finished to restore the original permissions."

# Ask the user if they want to continue
read -p "Do you want to continue? (yes/no): " confirm

if [[ "$confirm" != "yes" ]]; then
    echo "Exiting script."
    exit 0
fi

# Prompt the user for hidraw variable 
read -p "What number hidraw? (enter chrome://device-log/):" new_path

# Check if the user provided a path
if [ -z "$new_path" ]; then
    echo "Error: No path provided. you dissapoint me :("
    exit 1
fi

# Change ownership of the specified path
echo "Changing ownership to user '$USER'..."
sudo chown "$USER:$USER" "/dev/hidraw$new_path"

if [ $? -eq 0 ]; then
    echo "Ownership changed successfully."
else
    echo "Failed to change ownership. Please check your permissions."
fi