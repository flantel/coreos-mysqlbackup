
# MySQL Backup Container

Container to automatically back up mysql using automysqlbackup.

This is designed to run on CoreOS and includes a mysqlbackup.service  unit  and a mysqlbackup.timer unit which fires up the container once per day and saves the backups to a volume mounted on the host. From there I rsync it off site.

It uses ssmtp as a lightweight mailer for any logs and all relevant settings are done either via "-e" environment variables, or through editing the automysqlbackup.default file.

See mysqlbackup.service file for docker command line.


