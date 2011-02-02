#! /opt/local/bin/perl
use warnings;
use strict;

use File::Temp ();
use Cwd;
use File::Spec;

my $dir_template = 'temp_dir_XXXX';
my %opt_dir = (
    DIR             => '.',
);
my %opt_file = (
    TEMPLATE        => 'temp_file_XXXX',
    SUFFIX          => '.tmp',
);

# create temporary dir
my $tmpdir = File::Temp->newdir($dir_template, %opt_dir, CLEANUP => 0)
    or die "cannot create tmp file.";
print "DIRNAME: ", $tmpdir->dirname(), "\n";

# create temporary file in the temporary dir
my $fh = File::Temp->new( %opt_file, DIR => File::Spec->catfile( getcwd(), $tmpdir->dirname() ) )
    or die "cannot create tmp file.";
print "FILENAME: ", $fh->filename(), "\n";

# DO NOT delete temporary file (default is 1)
$fh->unlink_on_destroy( 0 );

# wait and see tmpfile and tmpdir is created. enter any key to continue.
<STDIN>;
