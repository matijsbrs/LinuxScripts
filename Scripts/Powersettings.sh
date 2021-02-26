#!/bin/bash

# Turn off the harddisk after 60*5 (5 minutes) 

hdparm -S 60 /dev/sdb
