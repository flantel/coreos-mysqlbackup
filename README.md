
# MySQL Backup Container

Container to automatically back up mysql using automysqlbackup.

This is designed to run on CoreOS and includes a mysqlbackup.service  unit  and a mysqlbackup.timer unit which fires up the container once per day and saves the backups to a volume mounted on the host. From there I rsync it off site.

It uses ssmtp as a lightweight mailer for any logs and all relevant settings are done either via "-e" environment variables, or through editing the automysqlbackup.default file.

Run it like:
```
docker run --rm -v /var/container_data/mysqlbackup/:/var/lib/automysqlbackup  --link revive-mysql:mysql \
	-e DB_HOST=<mysql host> -e DB_USER=<db_user> -e DB_PASS=<db_pass> -e MAILTO=<who to email logs to> \
	-e MAILFROM=<who the email should come from> \
	-e SMTP_USER=<Auth for ssmtp> -e SMTP_PASS=<password for ssmtp> \
	barryflanagan/automysqlbackup
```

The idea behind this is that it is not a long-running container - you run it, and it will do a backup then will exit. I use it for backing up databases running on CoreOS, but it might be useful for others running Docker.

See mysqlbackup.service and mysqlbackup.timer files for CoreOS usage.


