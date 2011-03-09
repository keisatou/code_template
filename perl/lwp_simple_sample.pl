#! /opt/local/bin/perl
use strict;
use warnings;

use Encode;
use utf8;
use encoding 'utf8';
binmode(STDERR, ':raw :encoding(utf8)');

use LWP::Simple;

my $id = shift || '074';

my $url = "http://www.anzen.mofa.go.jp/info/info4.asp?id=$id";

my $content = get($url);
die "$url を読み込めませんでした。" unless defined $content;

$content = decode('shiftjis', $content);
$content =~ s/<!--(.*?)-->//gs;
my ($country) = $content =~ / SELECTED>▼([^<]+)</;
print "$country\n";

if ($content =~ m/現在、危険情報は出ておりませんが、/) {
    print "\t危険情報は出ていません。\n";
}
else {
    print "\t危険情報が出ています!\n";
}
print "\t詳細は http://www.anzen.mofa.go.jp/ を見てください。\n";
