use strict;
use warnings;

my @nums = (1, 2, 3);
my $nums = \@nums;

print "reference :$nums\n";
print "dereference : @$nums\n";
print "dereference : @$nums[0]\n";

my @nums2 = (1, 2, 3);
my $nums3 = \@nums2;
print "reference :$nums3\n";
print "dereference : @$nums3\n";
print "dereference : @$nums3[0]\n";

my $nums4 = [1, 2, 3];
print "reference :$nums4\n";
print "dereference : @$nums4\n";
print "dereference : @$nums4[0]\n";
