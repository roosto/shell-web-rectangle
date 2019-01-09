#!/usr/bin/env perl

use warnings;
use strict;

my $exit_val = 0;

print "0: `$0'\n";
foreach my $i (0 ... $#ARGV) {
	print $i + 1, ": `$ARGV[$i]'\n";
	if ( $ARGV[$i] =~ /--exit/i ) {
		if ($i + 1 <= $#ARGV && $ARGV[$i+1] =~ /^\d+$/) {
			$exit_val = $ARGV[$i+1];
		}
	}
}

exit $exit_val;
