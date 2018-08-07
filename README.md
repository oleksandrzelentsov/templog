# Templog
It's a simple service that logs Raspberry PI's temperature into a logfile on your system.

## Dependencies
- vcgencmd
- systemd
- rsyslog
- bash
- make

## Installation
```bash
sudo make install
```

## Looking at logs
You can use `journalctl`, but I find it comfortable like this:
```bash
less +F /var/log/temperature.log
```
