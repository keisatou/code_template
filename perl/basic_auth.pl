#! /opt/local/bin/perl
use strict;
use warnings;

use Encode;
use utf8;
use encoding 'utf8';
binmode(STDERR, ':raw :encoding(utf8)');

use LWP;

my $browser = LWP::UserAgent->new;
my $url = 'http://6109.jp/sambomaster/';
$browser->credentials(
    '6109.jp:80',
    '--- Basic Authentication ---',
    'userid' => 'password',
);

my $response = $browser->get($url);

die "ERROR: ", $response->header('WWW-Authenticate') || 'アクセスエラー', "\n",
$response->status_line, "\n",
"$url\nStopping..."
unless $response->is_success;

my $content = decode('utf-8', $response->content);
print "先行発売開始!!!\n" if $content =~ m/先行発売/;
