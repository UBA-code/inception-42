#!/bin/bash

mkdir -p /var/run/vsftpd/empty

useradd $FTP_USER && usermod --password $(echo $FTP_PASSWD | openssl passwd -1 -stdin) $FTP_USER
# allow commands to allow users to modify files
sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf
# enable prevent accessing files outside home directory
sed -i "s/#chroot_local_user=YES/chroot_local_user=YES/" /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
echo "local_root=/home/$FTP_USER/" >> /etc/vsftpd.conf
# Add the user to the vsftpd.userlist to allow a specific user
# to use the system login account to access your FTP service."
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
# NO - anyone can log in with an anonymous account."
# YES - the user will be denied to login when their name exists in this file."
echo "userlist_deny=NO" >> /etc/vsftpd.conf
echo $FTP_USER >> /etc/vsftpd.userlist
echo "background=NO" >> /etc/vsftpd.conf
echo "pasv_enable=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=20000" >> /etc/vsftpd.conf
echo "pasv_max_port=20010" >> /etc/vsftpd.conf
chown $FTP_USER:$FTP_USER /home/$FTP_USER

# Ensures that only the owner (your FTP user) 
# has access(a) to the /home/ directory.

vsftpd