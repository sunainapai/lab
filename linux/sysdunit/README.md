An example systemd service unit
===============================

Steps to run this example
-------------------------
 1. Install the service.

        sudo make install

 2. Ensure that the service starts automatically after reboot.

        sudo reboot

        # After reboot enter the following commands:
        sudo systemctl status bar
        sudo journalctl -u bar
        tail -f /var/log/bar/bar.log

 3. In case, reinstallation is required, enter the following commands:

        sudo make uninstall
        sudo make install


Notes
-----
The following option is necessary if the service is to be enabled to
start automatically on system startup.

    [Install]
    WantedBy=multi-user.target

If this option is missing, then an attempt to run
`sudo systemctl enable bar` leads to the following error.

    The unit files have no installation config (WantedBy, RequiredBy, Also, Alias
    settings in the [Install] section, and DefaultInstance for template units).
    This means they are not meant to be enabled using systemctl.
    Possible reasons for having this kind of units are:
    1) A unit may be statically enabled by being symlinked from another unit's
       .wants/ or .requires/ directory.
    2) A unit's purpose may be to act as a helper for some other unit which has
       a requirement dependency on it.
    3) A unit may be started when needed via activation (socket, path, timer,
       D-Bus, udev, scripted systemctl call, ...).
    4) In case of template units, the unit is meant to be enabled with some
       instance name specified.
