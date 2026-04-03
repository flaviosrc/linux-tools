# Samba Configuration

>You can configure samba and share folder's by editing the smb.conf (/etc/samba/smb.conf) file, there you will set the folder path and other properties.  
>Samba use the same systems user to access shared files, but will need create a special password for access these files.
>
>For create/change samba users password use `$ smbpasswd -a "username"`
>
>Also can create new users and groups using
>`$ adduser`  
>`$ addgroup`
>
>To default, new users group is they same usernames
