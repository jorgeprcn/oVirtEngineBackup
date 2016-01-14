#!/bin/bash

# NAME: Backup Engine oVirt (Hosted Engine)
# AUTHOR: Jorge Junior
# DESCRIPTION: Calls for the "engine-backup" command, responsible for backing up all files from the oVirt Engine.
# Originally thought to be used on Hosted Engines, but problably works with the regular oVirt Engine implementation.
# USAGE: Cron, weekly
# PROCESSNAME: engine-backup
# CONFIG: within the script, variables


# Variables:
OUTPUT="/root/backup_oVirtEngine/"			# Where to place the resulting backup
FILENAME="backupHostedEngine-"				# Name prefix for the backup
DATE=$(date +"%d-%m-%Y")				# Date to use while naming the resulting backup
DATE_DEL=$(date --date="13 weeks ago" +"%d-%m-%Y")	# When to delete old backups (13 weeks)

# Makes sure we have the folder to place the backup
mkdir /root/backup_oVirtEngine/

# Creates a new backup, complete:
engine-backup --mode=backup --scope=all --file=$OUTPUT$FILENAME$DATE.tar --log=$OUTPUT$FILENAME$DATE.log

# Deletes old backup:
rm -rf $OUTPUT$FILENAME$DATE_DEL.tar
rm -rf $OUTPUT$FILENAME$DATE_DEL.log
