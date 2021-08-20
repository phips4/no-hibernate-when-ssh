# no-hibernate-when-ssh
Prevent your linux (with gnome) from hibernating when logged in with SSH

The following command adds a new script to your SSHD [pam](http://www.linux-pam.org/) file which handles the
preventing and reactivating functionalities.

**currently work in progress**

## installation

```sh
wget -O - https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/install.sh | sh
```
## todo list
- [x] switched from .bashrc / .bash_logout to [pam](http://www.linux-pam.org/)
- [x] download and link script files
- [x] provide an installation 
- [x] disable hibernate mode on ssh activity
- [ ] enable hibernate mode when all ssh sessions are closed
- [x] move files into own directory (/etc/no-hibernate-when-ssh/)
- [ ] verify checksums on file download
- [ ] provide a way to check if no hibernate is active