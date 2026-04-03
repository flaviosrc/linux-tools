# Linux Permissions Reference

`$ chmod ['owner', 'group', 'others'] file/directory`

The permissions levels go 1 to 7, by increasing each permission level

Read Permission 'R': 4
Write Permission 'W': 2
Execute Permission 'X': 1

To get RW(4+2) for only owner and group

`$ chmod 660 file/directory`

['-', 'd'] ['rwx'] ['rwx'] ['rwx']
'-' = files, 'd' = directory, follow by owner, group and others permissions
