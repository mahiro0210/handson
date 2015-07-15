use strict;
use warnings;

use Scalar::Util 'looks_like_number';

my @nums = @ARGV;

foreach my $num (@nums) {
  die "Arguments muse be numbers"
    unless looks_like_number($num);
}

my $max = max(@nums);

my $min = min(@nums);

print "max: $max\n" .
      "min: $min\n";

sub max {
  my @nums = @_;
  my $max;
  foreach my $num (@nums) {
    $max = $num if !defined $max || $num > $max;
  }
  return $max;
}

sub min {
  my @nums = @_;
  my $min;
  foreach my $num (@nums) {
    $min = $num if !defined $min || $num < $min;
  }
  return $min;
}
