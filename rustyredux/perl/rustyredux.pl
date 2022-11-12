#!/usr/bin/env perl 
#===============================================================================
#
#         FILE:  rustyredux.pl
#
#        USAGE:  ./rustyredux.pl
#
#  DESCRIPTION:
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  YOUR NAME (),
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  11/12/22 15:53:13
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use v5.24;
use FindBin;
use FFI::Platypus 2.00;
use Data::Dumper;

( bless {}, __PACKAGE__ )->main();

sub shared_lib  { "$FindBin::Bin/../target/release/librustyredux.so" }

sub release_lib { "$FindBin::Bin/../target/debug/deps/librustyredux.so" }

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


    return 0;
}

