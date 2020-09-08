=encoding utf8

=head1 NAME

CInet::Alien::MiniSAT::All - The AllSAT solver nbc_minisat_all

=cut

# ABSTRACT: The AllSAT solver nbc_minisat_all
package CInet::Alien::MiniSAT::All;
use base qw(Alien::Base);

=head1 SYNOPSIS

    use IPC::Run3;
    use CInet::Alien::MiniSAT::All qw(nbc_minisat_all);

    # Run AllSAT solver on a DIMACS CNF file, process each model in &take_model
    run3 [nbc_minisat_all, $cnf_file], \undef, \&take_model, \undef;

    # Clauses produced programmatically can be sent to stdin
    run3 [nbc_minisat_all], \&produce_clauses, \&take_model, \undef;

=head2 VERSION

This document describes CInet::Alien::MiniSAT::All v1.0.0.

=cut

our $VERSION = "v1.0.0";

=head1 DESCRIPTION

This module builds a custom version of Takahisa Toda and Takehide Soh's
AllSAT solver C<nbc_minisat_all>. The C<nbc> variant of their solvers
uses a backtracking algorithm to enumerate all solutions to a Boolean
formula in conjunctive normal form. Because of the backtracking, it can
start producing models right away (without a knowledge compilation step)
and its memory consumption stays at bay (unlike a blocking-clause-based
algorithm). It is especially suitable for enumerations of moderate sizes
and where the consumer wants a steady stream of models.

The package C<CInet::Alien::MiniSAT::All> is an L<Alien::Base> with one
additional method:

=head2 exe

    my $program = CInet::Alien::MiniSAT::All->exe;

Returns the absolute path of the C<nbc_minisat_all> executable bundled
with this module.

Note that the basename of this path is not guaranteed to be exactly
C<nbc_minisat_all>. It may have a custom suffix like C<_static>.

=head1 EXPORTS

There is one optional export:

=head2 nbc_minisat_all

    use CInet::Alien::MiniSAT::All qw(nbc_minisat_all);
    my $program = nbc_minisat_all;

Returns the same path as C<exe> but is shorter to type.

=cut

use File::Spec::Functions;

our @EXPORT_OK = qw(nbc_minisat_all);
use Exporter qw(import);

sub exe {
    my $self = shift;
    catfile($self->dist_dir, $self->runtime_prop->{exename});
}

sub nbc_minisat_all {
    __PACKAGE__->exe
}

=head1 SEE ALSO

=over

=item *

The original source code for C<nbc_minisat_all> is on Takahisa Toda's
website L<http://www.sd.is.uec.ac.jp/toda/code/nbc_minisat_all.html>.

=item *

The source code repository of the fork bundled with this module is
L<https://github.com/taboege/nbc_minisat_all>.

=back

=head1 AUTHOR

Tobias Boege <tobs@taboege.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (C) 2020 by Tobias Boege.

This is free software; you can redistribute it and/or
modify it under the terms of the Artistic License 2.0.

=cut

":wq"
