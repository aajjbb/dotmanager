#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';

my $base_dir = $ENV{'HOME'};
my $current_dir = $ENV{'PWD'};

=pod
%file maps files/folder to their right place in the file system
=cut

my %files = (
    ".emacs" => $base_dir,
);

=doc
    Install dotfiles of the current repository for the current user in the system
=cut

sub install {
    print('Starting the Installing Process\n');

    foreach my $key (keys %files) {
        my $source_file = $current_dir . "/" . $key;
        my $destiny_file = $files{$key} . "/" . $key;

        print('Are you sure you want to install $key ? [y/n]');

        my $answer = <STDIN>;

        chomp($answer);

        if ($answer eq 'y' || $answer eq 'Y') {
            print("Installing " . $key . " in " . $destiny_file . "\n");

            my $result = `cp -TR $source_file $destiny_file`;

            if ($result) {
                say "Failed to install " . $key . " is probably being used by other application or it does not exists";
            }
        } else {
            print("Skipping $key update\n");
        }
    }
}

=doc
    Updates the current system dotfiles to the repository
=cut

sub update {
    print('Starting the Uploading Process\n');

    foreach my $key (keys %files) {
        my $source_file = $files{$key} . "/" . $key;
        my $destiny_file = $current_dir . "/" . $key;

        print('Are you sure you want to upload $key ? [y/n]');

        my $answer = <STDIN>;

        chomp($answer);

        if ($answer eq 'y' || $answer eq 'Y') {
            print("Uploading " . $source_file . " in " . $destiny_file . "\n");

            my $result = `cp -TR $source_file $destiny_file`;

            if ($result) {
                print("Failed to update " . $key . " is probably being used by other application  or it does not exists\n");
            }
        } else {
            print("Skipping $key update\n");
        }
    }
}

if ($#ARGV != 0) {
    print("Usage: perl dotmanager.pl [OPTIONS]\n
          --install [Install current files in repository to system]\n
          --update [Update files in repository with ones from the system]\n");
} else {
    if ($ARGV[0] eq "--install") {
        install;
    } elsif ($ARGV[0] eq "--update") {
        update;
    } else {
        print("Invalid argument");
    }
}
