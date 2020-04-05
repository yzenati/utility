utility
=======

Utility aliases and functions.

Adds colour to `ls`, `grep` and `less`.

Aliases
-------

### ls

  * `ls` lists directories first (GNU only) and with colour (applies to all aliases below).
  * `ll` lists with long format and human-readable sizes (applies to all aliases below).
  * `l`  lists all files.
  * `lr` lists recursively.

### File downloads

  * `get` is short for ( `aria2c` || `axel` || `wget` || `curl` ).

### Resource usage

  * `df` reports file system disk usage with human-readable sizes.
  * `du` reports file disk usage with human-readable sizes.

### Condoms

  * `chmod` changes file mode verbosely, not operating from `/` (GNU only).
  * `chown` changes file owner verbosely, not operating from `/` (GNU only).
  * `rm` uses `safe-rm` if available.

### Misc

  * `mkcd` creates and changes to the given directory.
