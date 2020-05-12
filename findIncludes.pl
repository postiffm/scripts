#!/usr/bin/perl

while ($ln = <>) {
    $pcs = split('\s+', $ln);
    foreach $pc (@pcs) {
	if ($pc =~ /-I(.*)/) {
	    # Print the include I just found
	    print $pc;
	}
    }
}
