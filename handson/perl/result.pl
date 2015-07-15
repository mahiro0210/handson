use strict;
use warnings;

my %scores = (math => 55, english => 70, japanese => 100);

foreach my $subject (sort keys %scores) {
  my $score = $scores{$subject};
  if ($score >= 80){
    print "$subject: good\n";
  }
  elsif ($score >=60) {
    print "$subject: pass\n";
  }
  else {
    print "$subject: failed\n";
  }
}
