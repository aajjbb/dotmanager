dotmanager
==========

Perl script to automate the process of install and update our classical dotfiles repositories.

Usage:
------
1. Clone this repository and copy 'dotmanager.pl' to your dotfiles repository
2. Open dotmanager.pl and configure the hash %files to your repository needs, you must map the file name with it's folder in your system.
**. To install the current files of the repository to the system, run "perl dotmanager.pl --install"
**. To update the repository with changes you have done in the system, run "perl dotmanager.pl --update"


TODO:
-----
Simplify the way to ignore files.

	
