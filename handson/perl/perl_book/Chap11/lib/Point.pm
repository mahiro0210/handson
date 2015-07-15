package Point;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        x => 0,
        y => 0,
        @_
    };

    return bless $self, $class;
}

sub x {
    my $self = shift;

    if (@_) {
        $self->{x} = $_[0];
    }
    else {
        return $self->{x};
    }
}

sub y {
    my $self = shift;

    if (@_) {
        $self->{y} = $_[0];
    }
    else {
        return $self->{y};
    }
}

sub clear {
    my $self = shift;

    $self->x(0);
    $self->y(0);
}

1;