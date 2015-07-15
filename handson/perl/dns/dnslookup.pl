use strict;
use warnings;

my $file = './adn.co.jp';

open my $fh, '<', $file
  or die qq/Cannot open '$file': $!/;
while (my $line = <$fh>) {
  $line =~ /^(\w*.*\.)\s+(\d*)\s+(\w+)\s+(\w+)\s+(\w+.*\.)/i;
  print $line;
  if ($4 eq "NS") {
    print "NS\n";
  } elsif ( $4 eq "A") {
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
