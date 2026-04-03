#!/bin/bash 
echo "
how to config debian to resume from hibernation with /swapfile inside encrypted root partition

1 - get the swapfile physical offset:
filefrag -v /swapfile
# the physical offset is the 4º value of the first row initiated by '0:', ex. '28571648'. 

2 - get the root directory path:
df -h
# if is encrypted, will look like this: '/dev/mapper/nvme0n1p3_crypt'.

3 - edit grub config file and add the resume information:
vi /etc/default/grub
# add 'resume=/dev/mapper/nvme0n1p3_crypt resume_offset=28571648' to GRUB_CMDLINE_LINUX_DEFAULT
# line before add: 'GRUB_CMDLINE_LINUX_DEFAULT="quiet"'
# line after add: 'GRUB_CMDLINE_LINUX_DEFAULT="quiet resume=/dev/mapper/nvme0n1p3_crypt resume_offset=28571648"'

4 - update grub
update-grub

# reboot before first hibernation to garanty that the changes has been write to grub
"
