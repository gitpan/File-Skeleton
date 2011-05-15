#!perl -T

use Test::More tests => 4;

BEGIN {
    use_ok( 'File::Skeleton::App' ) || print "Bail out!\n";
    use_ok( 'File::Skeleton::CreateFile' ) || print "Bail out!\n";
    use_ok( 'File::Skeleton::Register' ) || print "Bail out!\n";
    use_ok( 'File::Skeleton::SkeletonDirsFinder' ) || print "Bail out!\n";
}

diag( "Testing File::Skeleton::App $File::Skeleton::App::VERSION, Perl $], $^X" );
