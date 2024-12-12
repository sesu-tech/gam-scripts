#!/bin/bash

# Remove Contact From All Users' Contacts
# Created by: Sesu Tech <github.com/sesu-tech>
# Created on: 2024.08.12
# Modified on: 2024.08.12

# Variables
gam="/opt/taers232c/GAMADV-XTD/gamadv-xtd3/gam"

# Prompt For Employee Email
echo "Please enter the contact's email (ex: jdoe@company.org)"
read email
read -r -p  "You entered "$email", are you sure you'd like to continue? [y/N]" -n 1
echo
case "$REPLY" in
        y|Y ) echo "Continuing.";;
        * ) echo "Exiting."; exit;;
esac

# Remove Contact
echo "Removing Contact from All User 'Contacts'"
$gam all users delete contacts emailmatchpattern "$email"

echo "Removing Contact from All User 'Other Contacts'"
$gam all users delete othercontacts emailmatchpattern "$email"

echo "All done!"
exit
