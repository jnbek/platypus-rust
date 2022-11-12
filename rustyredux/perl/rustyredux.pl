#!/usr/bin/env perl 

use strict;
use warnings;
use v5.24;
use FindBin;
use FFI::Platypus;
use Data::Dumper;

( bless {}, __PACKAGE__ )->main();

sub release_lib { "$FindBin::Bin/../target/release/librustyredux.so" }

sub debug_lib { "$FindBin::Bin/../target/debug/deps/librustyredux.so" }

sub ffi {
    my $self = shift;
    my $lib  = shift;
    return $self->{'_ffi'} ||= FFI::Platypus->new(
        api => 2,
        lib => $lib,
    );
}

sub main {
    my $self = shift;
    my $ffi  = $self->ffi( $self->debug_lib );
    $ffi->attach( make_point   => [ 'int',    'int' ]    => 'string' );
    $ffi->attach( get_distance => [ 'string', 'string' ] => 'double' );
    say "Test", make_point( 2, 2 );


    return 0;
}
__END__
my $make_point = FFI::Raw->new(
    $libpoints,
    'make_point',
    FFI::Raw::string,
    FFI::Raw::int, FFI::Raw::int,
);

my $get_distance = FFI::Raw->new(
    $libpoints,
    'get_distance',
    FFI::Raw::double,
    FFI::Raw::string, FFI::Raw::string,
);

my $p1 = $make_point->call(2,2);
my $p2 = $make_point->call(4,4);

my $result = $get_distance->call($p1, $p2);
say "The distance from (2,2) to (4,4) is $result (the square root of 8).";

