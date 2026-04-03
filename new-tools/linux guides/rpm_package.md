# Tools and utilities for rpm packaging

An rpm package is simply a header structure on top of a CPIO archive. The 
package itself is comprised of four sections: a *header* with a leading identifier 
that identifies the file as an RPM package, a *signature* to verify the integrity 
of a package, the *header data* containing package information, version, numbers, 
and copyright messaging, and the *archive* containing the actual program files.

## Convert rpm to cpio and extract to a directory

`$ rpm2cpio package.rpm | cpio -idmv`

-i : extract file from archive
-d : create the leading directories
-m : preserve the file modification date
-v : verbose

## List files in rpm package

`$ rpm -qlpv uninstalledPackage.rpm`

`$ rpm -qlv installedPackageName`

-q : specify it as a query command
-l : list the files in package
-p : query the uninstalled package
-v : verbose
