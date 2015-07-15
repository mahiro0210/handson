use strict;
use warnings;

#my @nums = @ARGV;

my $total;
#foreach my $num (@nums) {
foreach my $num (@ARGV) {
	$total += $num;
}

print "Total: $total\n";
