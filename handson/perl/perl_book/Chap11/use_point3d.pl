use FindBin;
use lib "$FindBin::Bin/lib";
use Point3D;

my $point3d = Point3D->new;

$point3d->x(1);
$point3d->y(2);
$point3d->z(3);

print "(" . $point3d->x . "," . $point3d->y . "," . $point3d->z . ")";