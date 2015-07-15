use strict;
use warnings;

open my $fh, '<', $file
  or die "Cannot open '$file': $i";
while (my $line = <$fh>) {
  $line =~ /^(\w*.*\.)\s+(\d*)\s+(\w+)\s+(\w+)\s+(\w+.*\.)/i
  if ($4 eq "NS") {
    print "NS\n";
  elsif ( $4 eq "A") {
    print "A\n";
  }  
}

close $fh;



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
