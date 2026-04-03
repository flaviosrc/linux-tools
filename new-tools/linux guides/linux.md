# Linux cli

## Utils

```shell
$ sudo su // root user
$ nano // text ui
$ shutdown -h +60
$ shutdown -c
$ apt install
> Mounting
$ mount dev/cdrom /media //(disk path) and (mounting path)
```

## Package Installation

```shell
$ dpkg -i package_file.deb
$ tar -vzxf nome_pacote.tar.gz
$ tar -xJf pacote.tar.xz
$ sh install.sh
$ ./configure
$ make
$ make install
$ apt-get autoremove

> Permissions
$ chmod 775 /var/www/html //Get fodler full permission
$ chown -R "USUARIO" /var/www/html //Change folder owner

> Properties  
sudo = Run as Root user  
-f = Install Dependencies  
-y = Auto Confirm
```
