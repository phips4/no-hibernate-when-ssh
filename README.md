# no-hibernate-when-ssh
Prevent your linux (ubuntu) machine from hibernating if there are SSH connections.

The following command adds logic to your .bashrc and .bash_logout files to disable hibernate mode when SSH connections are open and reenables it when all SSH sessions are closed.

**disclaimer: currently work in progress**

## installation

```sh
wget -O - https://raw.githubusercontent.com/phips4/no-hibernate-when-ssh/master/install.sh | sh
```
## todo list
- [x] download and link script files to .bashrc and .bash_logout
- [x] provide an installation 
- [ ] disable hibernate mode on ssh activity
- [ ] enable hibernate mode when all ssh sessions are closed
- [ ] verify checksums on file download
- [ ] provide a way to check if no hibernate is active