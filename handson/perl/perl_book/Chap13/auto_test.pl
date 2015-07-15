use strict;
use warnings;

my $expect = 4;
my $get = twice(2);

if($expect == $get) {
    print "ok";
}
else { print "not ok" }

sub twice {
    my $value = shift;
    
    return $value * 2;
}
