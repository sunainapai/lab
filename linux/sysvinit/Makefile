install:
	# Install scripts.
	cp foo /etc/init.d/foo
	cp foo.py /usr/local/bin
	chmod 755 /etc/init.d/foo /usr/local/bin/foo.py
	mkdir -p /var/log/foo
	systemctl daemon-reload
	# Create system user.
	adduser --system --home /nonexistent --no-create-home foo
	chown foo /var/log/foo
	# Register service to start automatically.
	update-rc.d foo defaults

uninstall:
	-service foo stop
	-update-rc.d foo remove
	-deluser foo
	-rm -f /etc/init.d/foo /usr/local/bin/foo.py
