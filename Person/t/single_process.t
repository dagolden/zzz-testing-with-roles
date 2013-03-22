use Test::More;
use Moo::Role;

use lib 't/lib';

my @test_roles = qw(
    TestPerson
    TestEmployee
);

for my $r ( @test_roles ) {
    my $c = Moo::Role->create_class_with_roles('Test::Roo::Class', $r);
    $c->run_tests($r);
}

done_testing;
