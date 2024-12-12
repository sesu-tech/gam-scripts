#!/bin/bash

# Set A Google Group's Privacy Options
# Created by: Sesu Tech <github.com/sesu-tech>
# Created on: 2024.12.03
# Modified on: 2024.12.03

# Variables
gam="/opt/taers232c/GAMADV-XTD/gamadv-xtd3/gam"

# Prompt For Group Email
echo "Please enter the group's email (ex: for "staff@company.org")"
read group
read -r -p  "You entered "$group", are you sure you'd like to continue? [y/n]" -n 1
echo
case "$REPLY" in
        y|Y ) echo "Continuing...";;
        * ) echo "Exiting..."; exit;;
esac

# Prompt For Address List Setting
read -r -p  "Would you like the group to show up in Gmail's address list (when composing an email)? [y/n]" -n 1
echo
case "$REPLY" in
        y|Y ) echo "Setting address list visibility to TRUE..." && $gam update group $group include_in_global_address_list true;;
        n|N ) echo "Setting address list visibility to FALSE..." && $gam update group $group include_in_global_address_list false;;
esac

# Prompt For Group Directory Setting
read -r -p  "Would you like the group to show up in the Google Groups directory (groups.google.com/all-groups)? [y/n]" -n 1
echo
case "$REPLY" in
        y|Y ) echo "Setting group directory visibility to TRUE..." && $gam update group $group show_in_group_directory true;;
        n|N ) echo "Setting group directory visibility to FALSE..." && $gam update group $group show_in_group_directory false;;
esac

echo "All done!"
exit
