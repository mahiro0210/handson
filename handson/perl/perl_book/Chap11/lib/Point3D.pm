package Point3D;

use base 'Point';

sub new {
    my $self = shift->SUPER::new(@_);
    $self->{z} = 0 unless exists $self->{z};
    return $self;
}

sub z {
    my $self = shift;

    if (@_) {
        $self->{z} = $_[0];
    }
    else {
        return $self->{z};
    }
}

sub clear {
    my $self = shift;
    $self->SUPER::clear;
    $self->z(0);
}

1;
