#!/usr/bin/perl
$totalPackets = 0;
while (<>) {
    if (/missed ([0-9]+) packets/)  {
	$packets = $1;
	print "Added $packets packets\n";
	$totalPackets += $packets;
    }
}

print "Total packets lost was ", $totalPackets, "\n";
