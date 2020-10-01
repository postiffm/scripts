#!/usr/bin/perl

while ($ln = <>) {
    #print $ln;
    my @pcs = split(/\s+/, $ln);
    foreach $pc (@pcs) {
	#print $pc;
	if ($pc =~ /-I(.*)/) {
	    # Print the include I just found
	    print $1, "\n";
	}
    }
}
