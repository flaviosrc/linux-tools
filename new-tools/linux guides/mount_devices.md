# How to mount disk and encrypted drisk on linux

## Mounting

Mounting disk sda1(s:SCSI(Small Computer System Interface), d:Disk, a:master) 
in /mnt folder.

`$ mount /dev/sda1 /mnt`

Mounting a encrypted disk.
First, uncrypt the disk and name it (will be mounted in /dev/mapper/diskName).

`$ cryptsetup open /dev/sda2 diskName`

Second, mount the disk.

`$ mount /dev/mapper/diskName /mnt`

## Unmointing

`$ umount /mnt`

## Recomendations

Create a directory to each device before mounting (mkdir /mnt/diskName).
