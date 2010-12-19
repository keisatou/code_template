#! /opt/local/bin/perl
use warnings;
use strict;

use Getopt::Long;
use Pod::Usage;


my %opt = (
    'help'      => 0,
    'man'       => 0,
);

GetOptions(\%opt,
    'help|?',
    'man') or pod2usage(2);
pod2usage(1) if $opt{help};
pod2usage(-exitval => 0, -verbose => 2) if $opt{man};

__END__

=head1 NAME

pod.pl - sample POD. see perldoc perlpod for details.

=head1 SYNOPSIS

B<pod.pl> B<arg> [B<--opt1>] [B<--opt2>]

=head1 DESCRIPTION

I<pod.pl> is a sample code for Pod::Usage.

=head1 EXAMPLE

pod.pl --help

pod.pl --man

=head1 OPTIONS

=over 5

=item B<--help>

prints out a brief help mesage.

=item B<--man>

prints out a long description.

=head1 AUTHOR

Keiichi Satou <sato3.k@gmail.com>

=cut

