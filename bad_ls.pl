#!/usr/bin/env perl

use strict;
use warnings;

if ( ! @ARGV ) {
	# no args, list current directory
	print join("\n", list_dir('.')), "\n";
}
else {
	print join("\n", list_dir(@ARGV)), "\n";
}

sub list_dir {
	my @rv = (); # return a list of all files
	foreach my $dir (@_) {
		opendir(my $dh, $dir) or die "Can't open `$dir': $!";
		while (my $dir_ent = readdir $dh) {
			push @rv, "$dir/$dir_ent";
		}
		closedir $dh;
	}

	return @rv;
}