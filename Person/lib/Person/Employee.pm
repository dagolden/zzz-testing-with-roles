use 5.008001;
use strict;
use warnings;

package Person::Employee;

use Moose;
extends 'Person';

has 'employee_number' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

1;

# vim: ts=4 sts=4 sw=4 et:
