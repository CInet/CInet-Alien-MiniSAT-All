use strict;
use warnings;
use Test::More;
use Test::Alien;

use CInet::Alien::MiniSAT::All;

alien_ok 'CInet::Alien::MiniSAT::All';
run_ok([CInet::Alien::MiniSAT::All->exe, '-V'])
    ->success
    ->out_like(qr/nbc_minisat_all(?:_\w+)?: ([0-9.a-z]+)/);

done_testing;
