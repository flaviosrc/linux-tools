### Volume de Backup ###

# Criar volume virtual (50GB) no hd externo:

$ dd if=/dev/zero of=/media/user/E07D-77DE/backup.img bs=1G count=50

# Cryptografar o volume virtual:

$ sudo cryptsetup luksFormat /media/user/E07D-77DE/backup.img

# Formatar o volume cryptografado

$ sudo cryptsetup open /media/user/E07D-77DE/backup.img backup

$ sudo mkfs.ext4 /dev/mapper/backup

# Criar arquivo de chave:

$ sudo dd if=/dev/urandom of=/root/.key-backup bs=4096 count=1

$ sudo chmod 600 /root/.key-backup

# Adiciona chave ao disco:

$ sudo cryptsetup luksAddKey /media/user/E07D-77DE/backup.img /root/.key-backup

# descriptografar e montar

$ sudo cryptsetup --key-file=/root/.key-backup open /media/user/E07D-77DE/backup.img backup

$ sudo mkdir /mnt/backup

$ sudo mount /dev/mapper/backup /mnt/backup

# desmontar e fechar

$ sudo umount /mnt/backup
$ sudo cryptsetup close backup

#### Montagem automática ####

# adicionar no arquivo /etc/crypttab

*use "x-systemd.requires-mounts-for=/home/Documents" se estiver dentro de outra partição criptografada

storage /home/user/Documents/vault.img /root/.key-storage luks,nofail,x-systemd.requires-mounts-for=/home/Documents

# adicionar no arquivo /etc/fstab

/dev/mapper/storage   /mnt/storage   ext4   defaults,nofail   0  2

# Testar

$ sudo systemctl daemon-reload
$ sudo mount -a
