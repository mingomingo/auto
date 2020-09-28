systemctl stop TV
systemctl disable TV

echo "[Unit]
Description=TV
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount \\
TV:/ /mnt/TV \\
--config /admin/configs/rclone.conf \\
--log-level=NOTICE --log-file /admin/logs/TV.log \\
--uid=1000 --gid=1000 --umask=002 \\
--allow-other \\
--dir-cache-time 1000h \\
--vfs-cache-mode full \\
--vfs-cache-max-age 5m \\
--vfs-cache-max-size 25G \\
--vfs-read-chunk-size-limit 512M \\
--vfs-read-chunk-size 64M --buffer-size 32M \\
--rc --rc-no-auth --rc-addr :55718
ExecStartPost=/usr/bin/rclone rc vfs/refresh recursive=true --rc-addr 127.0.0.1:55718 _async=true
ExecStop=/bin/fusermount -uz /mnt/TV > /dev/null
TimeoutSec=60
User=0
Group=0

[Install]
WantedBy=multi-user.target " > /etc/systemd/system/TV.service

systemctl daemon-reload
systemctl enable --now TV

systemctl stop TV2
systemctl disable TV2

echo "[Unit]
Description=TV2
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount \\
TV2:/ /mnt/TV2 \\
--config /admin/configs/rclone.conf \\
--log-level=NOTICE --log-file /admin/logs/TV2.log \\
--uid=1000 --gid=1000 --umask=002 \\
--allow-other \\
--dir-cache-time 1000h \\
--vfs-cache-mode full \\
--vfs-cache-max-age 5m \\
--vfs-cache-max-size 25G \\
--vfs-read-chunk-size-limit 512M \\
--vfs-read-chunk-size 64M --buffer-size 32M \\
--rc --rc-no-auth --rc-addr :55719
ExecStartPost=/usr/bin/rclone rc vfs/refresh recursive=true --rc-addr 127.0.0.1:55719 _async=true
ExecStop=/bin/fusermount -uz /mnt/TV2 > /dev/null
TimeoutSec=60
User=0
Group=0

[Install]
WantedBy=multi-user.target " > /etc/systemd/system/TV2.service

systemctl daemon-reload
systemctl enable --now TV2


systemctl stop Movies
systemctl disable Movies

echo "[Unit]
Description=Movies
Wants=network-online.target
After=network-online.target

[Service]
Type=notify
ExecStart=/usr/bin/rclone mount \\
Movies:/ /mnt/Movies \\
--config /admin/configs/rclone.conf \\
--log-level=NOTICE --log-file /admin/logs/Movies.log \\
--uid=1000 --gid=1000 --umask=002 \\
--allow-other \\
--dir-cache-time 1000h \\
--vfs-cache-mode full \\
--vfs-cache-max-age 5m \\
--vfs-cache-max-size 25G \\
--vfs-read-chunk-size-limit 512M \\
--vfs-read-chunk-size 64M --buffer-size 32M \\
--rc --rc-no-auth --rc-addr :55717
ExecStartPost=/usr/bin/rclone rc vfs/refresh recursive=true --rc-addr 127.0.0.1:55717 _async=true
ExecStop=/bin/fusermount -uz /mnt/Movies > /dev/null
TimeoutSec=60
User=0
Group=0

[Install]
WantedBy=multi-user.target " > /etc/systemd/system/Movies.service

systemctl daemon-reload
systemctl enable --now Movies

