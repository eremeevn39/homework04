yum install -y nfs-utils
for i in 'rpcbind nfs-server rpc-statd nfs-idmapd firewalld'; do systemctl enable $i; systemctl start $i; done
mkdir -p /export/shared/upload
chmod 0755 /export/shared
chmod 0777 /export/shared/upload
echo "/export/shared  192.168.50.0/24(rw,async)" >> /etc/exports
exportfs -ra
#for i in 'nfs3 mountd rpc-bind'; do firewall-cmd --permanent '--add-service'=$i; done
firewall-cmd --get-services
firewall-cmd --permanent --add-service=nfs3
firewall-cmd --permanent --add-service=mountd
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --reload
