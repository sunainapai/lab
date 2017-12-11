install:
	# Install scripts.
	cp bar.service /etc/systemd/system
	cp bar.py /usr/local/bin
	chmod 755 /usr/local/bin/bar.py
	mkdir -p /var/log/bar
	systemctl daemon-reload
	# Create system user.
	adduser --system --home /nonexistent --no-create-home bar
	chown bar /var/log/bar
	# Register service to start automatically.
	systemctl enable bar

uninstall:
	-systemctl stop bar
	-systemctl disable bar
	-deluser bar
	-rm -f /etc/systemd/system/bar.service /usr/local/bin/bar.py
