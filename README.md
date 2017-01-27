dotmanager
==========

Perl script to automate the process of install and update our classical dotfiles repositories.

Usage:
------
1. Clone/Fork this repository and copy 'dotmanager.pl' to your dotfiles repository

2. Open dotmanager.pl and configure the hash %files to your repository needs, you must map the file name with it's folder in your system.
Example:
```
my %files = (
    ".emacs" => $base_dir
);
```

3. Changes `base_dir` the right base directory of your system (usually ~/), using base_dir variable let your %file hash to be less verbose.

* To install the current files of the repository to the system, run `perl dotmanager.pl --install`
* To update the repository with changes you have done in the system, run `perl dotmanager.pl --update`
* dotmanager now asks for each file individually whether you want to install/upgrade it. To skip this individual checking, use the `--skip` option. For example `perl dotmanager.pl --install --skip`

TODO:
-----
Simplify the way to ignore files.

	
