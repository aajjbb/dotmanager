#!/usr/bin/perl

package Dotmanager;

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
    Reads input prompt and returns answer (taken from StackOverflow)
=cut

sub prompt {
    my ($query) = @_;
    local $| = 1;
    print $query;
    chomp(my $answer = <STDIN>);
    return $answer;
}

=doc
    Install dotfiles of the current repository for the current user in the system
=cut

sub install {
    my $skip = shift;
    
    print("Starting the Installing Process \n");

    foreach my $key (keys %files) {
        my $source_file = $current_dir . "/" . $key;
        my $destiny_file = $files{$key} . "/" . $key;

        if (not $skip) {        
            my $answer = prompt("Are you sure you want to install $key ? [y/n]");

            if (not ($answer eq 'y' || $answer eq 'Y')) {
                print("Skipping $key update\n");
                continue;
            }
        }
        
        print("Installing " . $key . " in " . $destiny_file . "\n");
        
        my $result = `cp -TR $source_file $destiny_file`;
        
        if ($result) {
            say "Failed to install " . $key . " is probably being used by other application or it does not exists";
        }    
    }
}

=doc
    Updates the current system dotfiles to the repository
=cut

sub update {
    my $skip = shift;
    print("Starting the Uploading Process\n");

    foreach my $key (keys %files) {
        my $source_file = $files{$key} . "/" . $key;
        my $destiny_file = $current_dir . "/" . $key;

        if (not $skip) {            
            my $answer = prompt("Are you sure you want to upload $key ? [y/n]");

            if (not ($answer eq 'y' || $answer eq 'Y')) {
                print("Skipping $key update\n");
                continue;
            }
        }
        print("Uploading " . $source_file . " in " . $destiny_file . "\n");
        
        my $result = `cp -TR $source_file $destiny_file`;
        
        if ($result) {
            print("Failed to update " . $key . " is probably being used by other application  or it does not exists\n");
        }
    }
}

my $usage = "Usage: perl dotmanager.pl [OPTION] [BYPASS]\n
  Options: 
    --install [Install current files in repository to system]\n
    --update [Update files in repository with ones from the system]\n
  Bypass:
    --skip [Skip Confirmations]\n
    ";
    
if ($#ARGV == 0 || $#ARGV > 2) {
    print($usage);
} else {
    my $option = $ARGV[0];
    my $bypass = ($ARGV[1] and ($ARGV[1] eq "--skip")) or 0;
    
    if ($option eq "--install") {
        install($bypass);
    } elsif ($option eq "--update") {
        update($bypass);
    } else {
        print("Invalid argument\n$usage");
    }
}
