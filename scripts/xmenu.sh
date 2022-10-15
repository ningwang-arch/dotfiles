#!/bin/sh

xmenu <<EOF | sh &
IMG:$HOME/.config/xmenu/icons/applications.svg	Applications
	IMG:$HOME/.config/xmenu/icons/applications-accessories.png	Accessories
		IMG:$HOME/.config/xmenu/icons/android-file-transfer.png	Android File Transfer (MTP)	android-file-transfer
		IMG:$HOME/.config/xmenu/icons/org.gnome.ArchiveManager.png	Archive Manager	file-roller
		IMG:$HOME/.config/xmenu/icons/org.gnome.Calculator.png	Calculator	gnome-calculator
		IMG:$HOME/.config/xmenu/icons/org.gnome.clocks.png	Clocks (Clocks)	gnome-clocks
		IMG:$HOME/.config/xmenu/icons/compton.png	compton (X compositor)	compton
		IMG:$HOME/.config/xmenu/icons/org.gnome.DiskUtility.png	Disks	gnome-disks
		IMG:$HOME/.config/xmenu/icons/fcitx.png	Fcitx 5 (Input Method)	/usr/bin/fcitx5
		IMG:$HOME/.config/xmenu/icons/org.gnome.Nautilus.png	Files	nautilus --new-window
		IMG:$HOME/.config/xmenu/icons/org.gnome.font-viewer.png	Fonts	gnome-font-viewer
		IMG:$HOME/.config/xmenu/icons/org.gnome.gedit.png	gedit (Text Editor)	gedit
		IMG:$HOME/.config/xmenu/icons/input-keyboard.png	Keyboard layout viewer	kbd-layout-viewer5
		IMG:$HOME/.config/xmenu/icons/system-file-manager.png	Nemo	nemo
		IMG:$HOME/.config/xmenu/icons/nvim.png	Neovim (Text Editor)	st -e nvim
		IMG:/usr/share/icons/hicolor/22x22/apps/gnome-nettool.png	Network Tools (Network information tools)	gnome-nettool
		IMG:$HOME/.config/xmenu/icons/org.gnome.seahorse.Application.png	Passwords and Keys	seahorse
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	picom (X compositor)	picom
		IMG:$HOME/.config/xmenu/icons/postman.png	Postman	postman
		IMG:$HOME/.config/xmenu/icons/speedcrunch.png	SpeedCrunch	speedcrunch
		IMG:$HOME/.config/xmenu/icons/gvim.png	Vim (Text Editor)	st -e vim
		IMG:$HOME/.config/xmenu/icons/xarchiver.png	Xarchiver (Archive manager)	xarchiver
	IMG:$HOME/.config/xmenu/icons/applications-development.png	Development
		IMG:$HOME/.config/xmenu/icons/clion.png	CLion	"/usr/bin/clion"
		IMG:$HOME/.config/xmenu/icons/CMakeSetup.png	CMake	cmake-gui
		IMG:$HOME/.config/xmenu/icons/cppcheck-gui.png	Cppcheck	cppcheck-gui
		IMG:$HOME/.config/xmenu/icons/electron.png	Electron	electron
		IMG:$HOME/.config/xmenu/icons/intellij-idea-ultimate-edition.png	IntelliJ IDEA Ultimate Edition	intellij-idea-ultimate-edition
		IMG:$HOME/.config/xmenu/icons/postman.png	Postman	postman
		IMG:$HOME/.config/xmenu/icons/assistant.png	Qt Assistant	assistant
		IMG:$HOME/.config/xmenu/icons/QtProject-qtcreator.png	Qt Creator (C++ IDE for developing Qt applications)	qtcreator
		IMG:$HOME/.config/xmenu/icons/QtProject-designer.png	Qt Designer (Interface Designer)	designer
		IMG:$HOME/.config/xmenu/icons/linguist.png	Qt Linguist	linguist
		IMG:$HOME/.config/xmenu/icons/qdbusviewer.png	Qt QDBusViewer  (D-Bus Debugger)	qdbusviewer
		IMG:$HOME/.config/xmenu/icons/visual-studio-code.png	Visual Studio Code (Text Editor)	/usr/bin/code --unity-launch
	IMG:$HOME/.config/xmenu/icons/applications-graphics.png	Graphics
		IMG:$HOME/.config/xmenu/icons/org.gnome.Evince.png	Document Viewer	evince
		IMG:$HOME/.config/xmenu/icons/org.flameshot.Flameshot.png	Flameshot (Screenshot tool)	flameshot
		IMG:$HOME/.config/xmenu/icons/org.flameshot.Flameshot.png	Flameshot (Screenshot tool)	/usr/bin/flameshot
		IMG:$HOME/.config/xmenu/icons/org.gnome.eog.png	Image Viewer	eog
		IMG:$HOME/.config/xmenu/icons/org.nomacs.ImageLounge.png	nomacs (Image Viewer)	nomacs
	IMG:$HOME/.config/xmenu/icons/applications-internet.png	Internet
		IMG:$HOME/.config/xmenu/icons/network-wired.png	Avahi SSH Server Browser	/usr/bin/bssh
		IMG:$HOME/.config/xmenu/icons/network-wired.png	Avahi VNC Server Browser	/usr/bin/bvnc
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Free Download Manager	/usr/bin/fdm
		IMG:$HOME/.config/xmenu/icons/google-chrome.png	Google Chrome (Web Browser)	google-chrome-stable
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Icalingua	icalingua
		IMG:$HOME/.config/xmenu/icons/qbittorrent.png	qBittorrent (BitTorrent client)	qbittorrent
		IMG:$HOME/.config/xmenu/icons/telegram.png	Telegram Desktop	telegram-desktop --
		IMG:$HOME/.config/xmenu/icons/org.wireshark.Wireshark.png	Wireshark (Network Analyzer)	wireshark
	IMG:$HOME/.config/xmenu/icons/applications-multimedia.png	Multimedia
		IMG:$HOME/.config/xmenu/icons/mpv.png	mpv Media Player (Multimedia player)	mpv --player-operation-mode=pseudo-gui --
		IMG:$HOME/.config/xmenu/icons/com.obsproject.Studio.png	OBS Studio (Streaming/Recording Software)	obs
		IMG:$HOME/.config/xmenu/icons/multimedia-volume-control.png	PulseAudio Volume Control (Volume Control)	pavucontrol
		IMG:$HOME/.config/xmenu/icons/qv4l2.png	Qt V4L2 test Utility	qv4l2
		IMG:$HOME/.config/xmenu/icons/qvidcap.png	Qt V4L2 video capture utility	qvidcap
		IMG:$HOME/.config/xmenu/icons/wemeet.png	WemeetApp	wemeet
	IMG:$HOME/.config/xmenu/icons/applications-office.png	Office
		IMG:$HOME/.config/xmenu/icons/org.gnome.Calendar.png	Calendar	gnome-calendar
		IMG:$HOME/.config/xmenu/icons/org.gnome.Evince.png	Document Viewer	evince
		IMG:$HOME/.config/xmenu/icons/typora.png	Typora (Markdown Editor)	typora
		IMG:$HOME/.config/xmenu/icons/wps-office2019-kprometheus.png	WPS 2019 (WPS)	/usr/bin/wps
		IMG:$HOME/.config/xmenu/icons/wps-office2019-pdfmain.png	WPS PDF (Kingsoft Pdf Reader)	/usr/bin/wpspdf
		IMG:$HOME/.config/xmenu/icons/wps-office2019-wppmain.png	WPS Presentation (WPS Presentation)	/usr/bin/wpp
		IMG:$HOME/.config/xmenu/icons/wps-office2019-etmain.png	WPS Spreadsheets (WPS Spreadsheets)	/usr/bin/et
		IMG:$HOME/.config/xmenu/icons/wps-office2019-wpsmain.png	WPS Writer (WPS Writer)	/usr/bin/wps
		IMG:$HOME/.config/xmenu/icons/org.pwmt.zathura.png	Zathura	zathura
	IMG:$HOME/.config/xmenu/icons/preferences-desktop.png	Settings
		IMG:$HOME/.config/xmenu/icons/preferences-system-network.png	Advanced Network Configuration	nm-connection-editor
		IMG:$HOME/.config/xmenu/icons/display.png	ARandR (Screen Settings)	arandr
		IMG:$HOME/.config/xmenu/icons/blueman.png	Bluetooth Manager	blueman-manager
		IMG:$HOME/.config/xmenu/icons/preferences-desktop-theme.png	Customize Look and Feel (Customize Look and Feel)	lxappearance
		IMG:$HOME/.config/xmenu/icons/fcitx.png	Fcitx 5 Configuration (Input Method Configuration)	/usr/bin/fcitx5-configtool
		IMG:$HOME/.config/xmenu/icons/fcitx.png	Fcitx 5 Migration Wizard	fcitx5-migrator
		IMG:$HOME/.config/xmenu/icons/video-display.png	Monitor Settings	lxrandr
		IMG:$HOME/.config/xmenu/icons/multimedia-volume-control.png	PulseAudio Volume Control (Volume Control)	pavucontrol
		IMG:$HOME/.config/xmenu/icons/preferences-desktop-theme.png	Qt5 Settings	qt5ct
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Rygel Preferences (UPnP/DLNA Preferences)	rygel-preferences
	IMG:$HOME/.config/xmenu/icons/applications-system.png	System
		IMG:$HOME/.config/xmenu/icons/Alacritty.png	Alacritty (Terminal)	alacritty
		IMG:$HOME/.config/xmenu/icons/android-file-transfer.png	Android File Transfer (MTP)	android-file-transfer
		IMG:$HOME/.config/xmenu/icons/network-wired.png	Avahi Zeroconf Browser	/usr/bin/avahi-discover
		IMG:$HOME/.config/xmenu/icons/gnome-color-manager.png	Color Profile Viewer	gcm-viewer
		IMG:$HOME/.config/xmenu/icons/org.gnome.baobab.png	Disk Usage Analyzer	baobab
		IMG:$HOME/.config/xmenu/icons/fcitx.png	Fcitx 5 (Input Method)	/usr/bin/fcitx5
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Hardware Locality lstopo	lstopo
		IMG:$HOME/.config/xmenu/icons/htop.png	Htop (Process Viewer)	st -e htop
		IMG:/usr/share/icons/hicolor/22x22/apps/gnome-nettool.png	Network Tools (Network information tools)	gnome-nettool
		IMG:$HOME/.config/xmenu/icons/java11-openjdk.png	OpenJDK Java 11 Console	/usr/lib/jvm/java-11-openjdk/bin/jconsole
		IMG:$HOME/.config/xmenu/icons/java11-openjdk.png	OpenJDK Java 11 Shell	st -e /usr/lib/jvm/java-11-openjdk/bin/jshell
		IMG:$HOME/.config/xmenu/icons/utilities-terminal.png	ranger	st -e ranger
		IMG:$HOME/.config/xmenu/icons/utilities-terminal.png	st	st
		IMG:$HOME/.config/xmenu/icons/org.gnome.SystemMonitor.png	System Monitor	gnome-system-monitor
		IMG:$HOME/.config/xmenu/icons/org.gnome.Terminal.png	Terminal	gnome-terminal
		IMG:$HOME/.config/xmenu/icons/virt-manager.png	Virtual Machine Manager	virt-manager
		IMG:$HOME/.config/xmenu/icons/vmware-netcfg.png	Virtual Network Editor	/usr/bin/vmware-netcfg
		IMG:$HOME/.config/xmenu/icons/vmware-player.png	VMware Player	/usr/bin/vmplayer
		IMG:$HOME/.config/xmenu/icons/vmware-player.png	VMware Player	vmplayer
		IMG:$HOME/.config/xmenu/icons/vmware-workstation.png	VMware Workstation	/usr/bin/vmware
		IMG:$HOME/.config/xmenu/icons/vmware-workstation.png	VMware Workstation	vmware
	IMG:$HOME/.config/xmenu/icons/applications-other.png	Others
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Rofi	rofi -show
		IMG:$HOME/.config/xmenu/icons/application-x-executable.png	Rofi Theme Selector	rofi-theme-selector
IMG:$HOME/.config/xmenu/icons/terminal.svg	Open terminal...
	IMG:$HOME/.config/xmenu/icons/utilities-terminal.png	st	st
	IMG:$HOME/.config/xmenu/icons/Alacritty.png		alacritty	alacritty

IMG:$HOME/.config/xmenu/icons/system-lock-screen.svg	Lock			betterlockscreen -l
IMG:$HOME/.config/xmenu/icons/system-shutdown-panel.svg		Shutdown		shutdown -h now
IMG:$HOME/.config/xmenu/icons/system-reboot.svg		Reboot			reboot
IMG:$HOME/.config/xmenu/icons/logout.svg		Logout			kill -9 -1
EOF
