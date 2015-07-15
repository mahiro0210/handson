use strict;
use warnings;
use Data::Dumper 'Dumper';

my $nums = [1, 2, 3];
print "reference :$nums\n";
print "dereference : @$nums\n";
print "dereference : @$nums[0]\n";

my $score = {math => 89, english => 69};
print "reference :$score\n";

#my %hoge = %$score;
print %{$score}; 
print "\n";  
#print "dereference :" . %{$score} . "\n";

print Dumper $score;

print "dereference : \%$score\n";
print "dereference : $score->{english}\n";


