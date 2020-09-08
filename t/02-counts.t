use strict;
use warnings;
use Test::More;
use Test::Alien;

use File::Spec::Functions;
use CInet::Alien::MiniSAT::All qw(nbc_minisat_all);

my %COUNT = (
    'gaussoid4.cnf'   => 679,
    'orientable4.cnf' => 629,
    'oriented4.cnf'   => 34873,
    'markov5.cnf'     => 1024,
    'LUBF5.cnf'       => 1166,
);

for (sort keys %COUNT) {
    my $out = run_ok([nbc_minisat_all, catfile('t', $_)])->success->out;
    is split(/\n/, $out), $COUNT{$_}, 'count ok';
}

done_testing;
