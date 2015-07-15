use strict;
use warnings;

my @nums = @ARGV;

my $total = sum(@nums);

print "Total\n";
print "$total\n";

sub sum {
  my @nums = @_;
  
  my $total = 0;
    foreach my $num (@nums) {
    $total += $num;
#    print "$total\n";
  }
  return $total;
}
