use FindBin;
use lib "$FindBin::Bin/lib";
use Point;

my $point = Point->new;
print "(" . $point->x . "," . $point->y . ")";
