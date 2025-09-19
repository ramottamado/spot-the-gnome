install:
	mkdir -p ${HOME}/.local/bin
	cp spot-the-gnome ${HOME}/.local/bin/spot-the-gnome
	chmod +x ${HOME}/.local/bin/spot-the-gnome
	mkdir -p ${HOME}/.config/systemd/user
	cp spot-the-gnome.service ${HOME}/.config/systemd/user/spot-the-gnome.service
	cp spot-the-gnome.timer ${HOME}/.config/systemd/user/spot-the-gnome.timer
	systemctl --user daemon-reload

uninstall:
	systemctl --user stop spot-the-gnome.timer || true
	systemctl --user disable spot-the-gnome.timer || true
	rm -f ${HOME}/.config/systemd/user/spot-the-gnome.service
	rm -f ${HOME}/.config/systemd/user/spot-the-gnome.timer
	rm -f ${HOME}/.local/bin/spot-the-gnome
	systemctl --user daemon-reload
