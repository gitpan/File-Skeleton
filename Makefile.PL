use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => 'File::Skeleton',
    AUTHOR       => q{Marian Schubert <marian.schubert@gmail.com>},
    VERSION_FROM => 'lib/File/Skeleton/App.pm',
    ABSTRACT     => 'Make file creation easier using skeletons.',
    EXE_FILES    => ['bin/summon-file'],
    ( $ExtUtils::MakeMaker::VERSION >= 6.3002
        ? ( 'LICENSE' => 'perl' )
        : () ),
    PL_FILES  => {},
    PREREQ_PM => {
        'Test::More'     => 0,
        'Test::Class'    => 0,
        'File::Spec'     => 0,
        'Template'       => 0,
        'Moose'          => 0,
        'Modern::Perl'   => 0,
        'File::Basename' => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES    => 'File-Skeleton-*' },
);
