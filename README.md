# autofs
Puppet module to handle autofs

## Module description
AutoFS is a program that uses the Linux kernel automounter to automatically mount filesystems when an AutoFS directory has been accessed.

AutoFS works especially well with DFS shares, since Linux currently does not has support for DFS-R. Setting a timeout on an AutoFS share unmounts it when it's not in use, and then remounts it when accessed. Since DFS works with Active Directory links, which point to physical file shares, and these physical file share can move, unmounting and remounting a file share can give a system behavior that more closely resembles DFS-R.

This module aims to mount AutoFS shares as simple as possible. Each share is specified as a resource type, which in-turn ensures all the packages and services are available.

## Setup

### What the autofs module effects
- /etc/auto.master
- /etc/auto.master.d
- autofs packages
- autofs services

### Beginning with autofs

To install a CIFS share.

```
autofs::cifs::share {'auto.foo':
  source      => '/foo',
  destination => '//domain.com/app/foo',
  credentials => '/etc/foo.cred',
  domain      => 'domain.com',
  uid         => 'luksi1',
  gid         => 'luksi1',
}
```


