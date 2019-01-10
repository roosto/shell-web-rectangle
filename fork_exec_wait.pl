#!/usr/bin/env perl

use strict;
use warnings;

use POSIX ":sys_wait_h";

print "Parent: my pid is: $$\n";

my $fork_rv = fork();
die "fork(2) failed: $!" if  (! defined $fork_rv);

# child code execution
if ( $fork_rv == 0 ) {
	print " Child: my pid is: $$\n";
	sleep 1;

	# our very own super lame output redirection
	if ( defined $ENV{'OUT_FILE'} ) {
		my $new_fd = POSIX::open($ENV{'OUT_FILE'}, &POSIX::O_WRONLY | &POSIX::O_TRUNC)
			or die "could not POSIX::open '$ENV{'OUT_FILE'}', &POSIX::O_WRONLY | &POSIX::O_TRUNC: $!";
		POSIX::dup2($new_fd, 1)
			or die "could replace STDOUT with new filedes: $!"
	}

	printf " Child: exec'ing %s with parameters: %s\n",
		(@ARGV == 0 ? '<none>' : "`$ARGV[0]'"),
		(@ARGV <= 1 ? '<none>' : "'" . join("', '", @ARGV[1 .. $#ARGV]) . "'");

	exec @ARGV or die "exec(2) failed: $!"
}

print "Parent: waiting on pid $fork_rv\n";
my $wait_rv = wait;
if ( $wait_rv == -1 ) {
	die "parent unexpected had no child process\n";
}

print "Parent: pid $wait_rv exited with a status of ", $? >> 8, "\n";
