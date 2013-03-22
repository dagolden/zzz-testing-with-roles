package ObjectConstructor;

use Test::Roo::Role;
use MooX::Types::MooseLike::Base qw/Str HashRef InstanceOf/;
use Class::Load qw/load_class/;

has test_class => (
    is  => 'lazy',
    isa => Str,
);

requires '_build_test_class';

has init_args => (
    is  => 'lazy',
    isa => HashRef,
);

sub _build_init_args {
    return {};
}

has test_object => (
    is  => 'lazy',
    isa => InstanceOf ['Person'],
);

sub _build_test_object {
    my ($self) = @_;
    load_class $self->test_class;
    return $self->test_class->new( $self->init_args );
}

before 'setup' => sub {
    my $self = shift;
    ok( $self->test_object, 'We should have a test person' );
    isa_ok( $self->test_object, $self->test_class, '... and the object it returns' );
};

1;
