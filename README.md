dotmanager
==========

Perl script to automate the process of install and update our classical dotfiles repositories.

Usage:
------
1) Clone this repository and copy 'dotmanager.pl' to your dotfiles repository
2) Open dotmanager.pl and configure the hash %files to your repository needs, you must map the file name with it's folder in your system.

To update your repository with your last changes:
$ perl dotmanager.pl -update

To install your current dotfiles in the repository to the system:
$ perl dotmanager.pl -install

TODO:
-----
Simplify the way to ignore files.

	
