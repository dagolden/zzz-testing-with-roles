use 5.008001;
use strict;
use warnings;

package Person;
use Moose;

has [ 'first_name', 'last_name' ] => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

sub full_name {
    my $self = shift;
    return join ' ' => $self->first_name, $self->last_name;
}

1;

# vim: ts=4 sts=4 sw=4 et:
