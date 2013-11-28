Watchdir
========

Raspberry Pi dropbox script that crawls all subdirectories of parent and will download all files

Related repositories
--------------------

 * [andreafabrizi/Dropbox-Uploader](https://github.com/andreafabrizi/Dropbox-Uploader) - Dropbox-Uploader script that works with Raspberry Pi
 * [averissimo/deluge.commands](https://github.com/averissimo/deluge-commmands) (_Optional_) - Custom commands that deluge runs when finishes/starts a download
 * [dbr/tvnamer](https://github.com/dbr/tvnamer) (_Optional_) - Script that renames tv episodes

Install
-------

 * Clone the Dropbox-Uploader repository from https://github.com/andreafabrizi/Dropbox-Uploader
 * Create own ~/.watchdirrc config file from example and adapt the values
 * Run the script

Config file
-----------

### Dropbox-Uploader script
 * EXEC: Path to dropbox-uploader script

### Local file structure
 * PARENT_DIR: Top directory that will be crawled
 * SUFFIX: Suffix that should be matched
 * ADDED_LOG: Location of the added log
 * COMPLETED_LOG: Location of the completed log

### Dropbox file structure
 * REMOTE_TOP_PARENT: Name of directory in drobox that should be synced
 * REMOTE_PARENT_DIR: Mapping between PARENT_DIR and dropbox equivalent
 * REMOTE_ADDED_DIR: Where files that have the SUFFIX should be placed

See [watchdirrc.example](https://github.com/averissimo/watchdir/blob/master/watchdirrc.example) for more details
