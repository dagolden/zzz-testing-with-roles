package TestEmployee;

use Test::Roo::Role;
use MooX::Types::MooseLike::Base qw/Str HashRef/;

with 'TestPerson';

sub _build_test_class { 'Person::Employee' }

around '_build_init_args' => sub {
    my $orig = shift;
    return { %{ $orig->() }, employee_number => 666, };
};

test 'employee number' => sub {
    my $self   = shift;
    my $person = $self->test_object;
    is( $person->employee_number, 666,
        "... and we should get the correct employee number" );
};

1;
