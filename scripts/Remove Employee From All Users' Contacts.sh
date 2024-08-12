#!/bin/bash

# Remove Employee From All Users' Contacts
# Created by: Sesu Tech
# Created on: 2024.08.12
# Modified on: 2024.08.12

# Variables
gam="/opt/taers232c/GAMADV-XTD/gamadv-xtd3/gam"

# Prompt For Employee Email
echo "Please enter the employee's email (ex: jdoe@company.org)"
read email
read -r -p  "You entered "$email", are you sure you'd like to continue? [y/N]" -n 1
echo
case "$REPLY" in
        y|Y ) echo "Continuing...";;
        * ) echo "Exiting..."; exit;;
esac

# Remove Contact From All Users
echo "Removing Employee from All User 'Contacts'"
$gam all users delete contacts emailmatchpattern "$email"

echo "Removing Employee from All User 'Other Contacts'"
$gam all users delete othercontacts emailmatchpattern "$email"

echo "All done!"
exit
