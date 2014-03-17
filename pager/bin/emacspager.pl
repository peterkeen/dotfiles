#!/usr/bin/perl -w

use strict;
use File::Temp qw/ tempfile /;

unless($ENV{INSIDE_EMACS}) {
    exec($ENV{EMACSPAGER_ALTERNATE} || "less");
}

my ($fh, $filename) = tempfile();

my $linecount = 0;

my $max_lines_before_opening_buffer = $ENV{EMACSPAGER_MIN_LINES} || 40;

while(<>) {
    print $fh $_;
    $linecount++;
}

if ($linecount > $max_lines_before_opening_buffer) {
    `emacsclient -ne '(pak-pager "$filename")' 2>&1`;
} else {
    system("cat $filename");
}

close $fh;
