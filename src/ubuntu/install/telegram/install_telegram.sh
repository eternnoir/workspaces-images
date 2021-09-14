#!/usr/bin/env bash
set -ex
wget -q https://telegram.org/dl/desktop/linux -O /tmp/telegram.tgz
tar -xvf /tmp/telegram.tgz -C /opt/
rm -rf /tmp/telegram.tgz

wget -q https://kasm-static-content.s3.amazonaws.com/icons/telegram.png -O /opt/Telegram/telegram_icon.png

cat >/usr/share/applications/telegram.desktop <<EOL
[Desktop Entry]
Version=1.0
Name=Telegram Desktop
Comment=Official desktop version of Telegram messaging app
TryExec=/opt/Telegram/Telegram
Exec=/opt/Telegram/Telegram -- %u
Icon=/opt/Telegram/telegram_icon.png
Terminal=false
StartupWMClass=TelegramDesktop
Type=Application
Categories=Chat;Network;InstantMessaging;Qt;
MimeType=x-scheme-handler/tg;
Keywords=tg;chat;im;messaging;messenger;sms;tdesktop;
X-GNOME-UsesNotifications=true
EOL
chmod +x /usr/share/applications/telegram.desktop
cp /usr/share/applications/telegram.desktop $HOME/Desktop/telegram.desktop
chown 1000:1000 $HOME/Desktop/telegram.desktop
