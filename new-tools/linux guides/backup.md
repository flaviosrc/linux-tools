# Linux based system backup routines

> Tip! https://www.explainshell.com/

## Full system backup with rsync

Font: https://wiki.archlinux.org/title/Rsync#Full_system_backup

`rsync -aAXHv --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / /path/to/backup`

01. rsync - A fast, versatile, local and remote file-copying utility
02. -aAXHv - The files are transferred in "archive" mode, which ensures that symbolic links, devices, permissions, ownerships, modification times, ACLs, and extended attributes are preserved. The option -H preserves hard links, but uses more memory.
03. --exclude - Excludes the given directories from backup.
04. / - The Source directory
05. /path/to/backup - It is the backup destination folder.

* Important note: Please be mindful that you must exclude the destination directory, if it exists in the local system. It will avoid the infinite loop.

* If you use any sparse files, such as virtual disks, Docker images and similar, you should add the -S option.

Restore a backup

If you wish to restore a backup, use the same rsync command that was executed but with the source and destination reversed.

