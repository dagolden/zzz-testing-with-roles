package TestPerson;

use Test::Roo::Role;

with 'ObjectConstructor';

sub _build_test_class { 'Person' }

around '_build_init_args' => sub {
    my $orig = shift;
    return {
        %{ $orig->() },
        first_name => "Bob",
        last_name  => "Dobbs",
    };
};

test 'full_name' => sub {
    my $self   = shift;
    my $person = $self->test_object;
    is $person->full_name, join( " ", $person->first_name, $person->last_name ),
      '... and it should return the correct full name';
};

1;
