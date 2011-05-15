package File::Skeleton::Register;

use 5.006;
use strict;
use warnings;

=head1 NAME

File::Skeleton::Register - Skeletons register

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

my ( @rules, %skeleton );

=head1 SYNOPSIS

    registerSkeleton(qr/\.pm$/, 'perl/skeleton.pm');

    my $skeleton = chooseSkeleton('some/path/Module.pm');

=head1 EXPORT

=over 2

=item registerSkeleton

=item chooseSkeleton

=back

=cut

use Exporter 'import';
our @EXPORT_OK = qw(registerSkeleton chooseSkeleton);

=head1 SUBROUTINES/METHODS

=head2 registerSkeleton

Register new skeleton for a given rule. Use in I<rules.pl> file.

=cut

sub registerSkeleton {
    my ( $rule, $skeleton ) = @_;

    push @rules, $rule;
    $skeleton{$rule} = $skeleton;
}

=head2 chooseSkeleton

Choose the best skeleton for a given file.

=cut

sub chooseSkeleton {
    my ($fileName) = @_;

    foreach my $rule (@rules) {
        return $skeleton{$rule} if ruleMatches( $rule, $fileName );
    }

    return undef;
}

=head2 ruleMatches

Check if a filename matches a given rule.

=cut

sub ruleMatches {
    my ( $rule, $fileName ) = @_;

    return $fileName =~ $rule;
}

=head1 AUTHOR

Marian Schubert, C<< <marian.schubert at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-file-skeleton at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=File-Skeleton>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc File::Skeleton::Register


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=File-Skeleton>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/File-Skeleton>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/File-Skeleton>

=item * Search CPAN

L<http://search.cpan.org/dist/File-Skeleton/>

=back

=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2011 Marian Schubert.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of File::Skeleton::Register
