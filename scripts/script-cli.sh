yum install -y nfs-utils
systemctl enable firewalld
systemctl start firewalld
mount.nfs -vv 192.168.50.10:/export/shared /mnt -o nfsvers=3,proto=udp,soft
echo '192.168.50.10:/export/shared    /mnt    nfs    rsize=8192,wsize=8192,timeo=14,intr,udp' >> /etc/fstab

