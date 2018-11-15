#!/usr/bin/perl

# Take lines that look like this:
# 2018-01-02 18:00:39.604511 SO=174.54    BI=158.11       BO=191.75
# and process them for difference of BI to BO (boiler in to boiler out)
# Put the values into different buckets.

while ($ln = <>) {
  if ($ln =~ /SO=([0-9.]+)\s+BI=([0-9.]+)\s+BO=([0-9.]+)/) {
     $systemOut = $1;
	 $boilIn = $2;
	 $boilOut = $3;
	 $diff = int($boilOut - $boilIn);
	 $integerDiff = int($diff + 0.5); # int always rounds toward zero.
	 #print "Matched $systemOut $boilIn $boilOut diff=$integerDiff\n";
	 if ($systemOut > 140) {
	   $diffMap{$integerDiff}++;
	 }
	 else {
        $datapointsBelow140++;	 
	 }
  }
}

foreach $diff (sort keys %diffMap) {
  print $diff, "\t", $diffMap{$diff}, "\n";
}
print "Data points below systemOut of 140 = $datapointsBelow140\n";
