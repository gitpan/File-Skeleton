package File::Skeleton::SkeletonDirsFinder;

use 5.006;
use strict;
use warnings;

use Moose;
use File::Basename 'dirname';
use File::Spec;

=head1 NAME

File::Skeleton::SkeletonDirsFinder - The great new File::Skeleton::SkeletonDirsFinder!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

has 'skeletonsDir' => ( is => 'rw', default => '.skeletons' );

=head1 METHODS

=over 2

=item findForFile

Find skeleton directories for a given file.

=cut

sub findForFile {
    my ($self, $path) = @_;

    return map {
        File::Spec->join($_, $self->skeletonsDir)
    } $self->skeletonsParentDirs(dirname($path));
}

=item skeletonsParentDirs

TODO

=cut

sub skeletonsParentDirs {
    my ($self, $path) = @_;

    return $self->findSkeletonsParentDirs(File::Spec->rel2abs($path));
}

=item findSkeletonsParentDirs

TODO

=cut

sub findSkeletonsParentDirs {
    my ($self, $path, @paths) = @_;

    return (@paths, $path) if $path eq '/';
    return $self->findSkeletonsParentDirs(dirname($path), (@paths, $path));
}

=back

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use File::Skeleton::SkeletonDirsFinder;

    my $foo = File::Skeleton::SkeletonDirsFinder->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Marian Schubert, C<< <marian.schubert at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-file-skeleton at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=File-Skeleton>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc File::Skeleton::SkeletonDirsFinder


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

1; # End of File::Skeleton::SkeletonDirsFinder
