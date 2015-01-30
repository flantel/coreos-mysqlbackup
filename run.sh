#!/bin/bash

# Create /etc/mysql/debian.cnf using the values
# specified in the environment. 

cat << EOM > /etc/mysql/debian.cnf
[client]
host     = $DB_HOST
user     = $DB_USER
password = $DB_PASS
EOM

# Create the /etc/ssmtp/ssmtp.conf file for sending reports, using 
# values specified in the environment. The below is for a gmail account. Change to suit
# your mail relay
cat << EOM > /etc/ssmtp/ssmtp.conf
root=$MAILFROM
# Example for relaying to Gmail servers
mailhub=smtp.gmail.com:587
AuthUser=$SMTP_USER
AuthPass=$SMTP_PASS
UseTLS=YES
UseSTARTTLS=YES
EOM

# The only thing we want this unit to do is run automysqlbackup
# then exit. It is loaded using a .timer fleet unit.
/usr/sbin/automysqlbackup


