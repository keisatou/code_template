#! /opt/local/bin/perl
use warnings;
use strict;

use File::Temp ();
use Cwd;
use File::Spec;

my %opt_dir = (
    TEMPLATE        => 'temp_dir_XXXX',
    DIR             => '.',
);
my %opt_file = (
    TEMPLATE        => 'temp_file_XXXX',
    SUFFIX          => '.tmp',
);

# create temporary dir
my $tmpdir = File::Temp->newdir(%opt_dir, CLEANUP => 0);
print "DIRNAME: ", $tmpdir->dirname(), "\n";

# create temporary file in the temporary dir
my $fh = File::Temp->new( %opt_file, DIR => File::Spec->catfile( getcwd(), $tmpdir->dirname() ) );
print "FILENAME: ", $fh->filename(), "\n";

# DO NOT delete temporary file (default is 1)
$fh->unlink_on_destroy( 0 );

# wait and see tmpfile and tmpdir is created. enter any key to continue.
<STDIN>;
