#! /opt/local/bin/perl
use warnings;
use strict;

use YAML;
use Data::Dumper;


my %conf = (
    setting01 => 'val01',
    setting02 => {
        in_set02_01 => 'hoge',
        in_set02_02 => 'fuga',
    },
);

my $yaml = Dump \%conf;
#print $yaml;

my $c = Load $yaml;
print Dumper $c;
