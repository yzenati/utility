utility
=======

Utility aliases and functions.

Adds colour to `ls`, `grep` and `less`.

Sets PAGER to `most`, `less` or `more`.

Aliases
-------

### ls

  * `ls` lists directories first (GNU only) and with colour (applies to all aliases below).
  * `l` lists with long format and human-readable sizes (applies to all aliases below).
  * `ll`  lists all files.
  * `lr` lists recursively.

### Resource usage

  * `df` reports file system disk usage with human-readable sizes.
  * `du` reports file disk usage with human-readable sizes.

### Condoms

  * `chmod` changes file mode verbosely, not operating from `/` (GNU only).
  * `chown` changes file owner verbosely, not operating from `/` (GNU only).
  * `chgrp` changes file group verbosely, not operating from `/` (GNU only).

### Misc

  * `mkcd` creates and changes to the given directory.
  * `rm` shows message to use rmtrash or/and safe-rm if available, if not, execute the native rm command.
