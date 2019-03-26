#!/usr/bin/env perl
# Script to create module files.

use strict;
use warnings;
use Template;

my $num_args = $#ARGV + 1;

die ("Usage: perl create.pl test proj\n")
    unless ($num_args > 0 or $num_args < 3);

my $tt = Template->new(
    INCLUDE_PATH => 'template',
    RELATIVE => 1
);

my $mod  = shift;
my $proj = ($num_args == 2) ? shift : $mod;

die ("Unable to create module, $mod!\n") unless (mkdir $mod);

my %filemap = (
    "module.tt"    => "${mod}/${mod}.sv",    # module file
    "testbench.tt" => "${mod}/${mod}_tb.sv", # testbench
    "Makefile.tt"  => "${mod}/Makefile",     # compile flags
    "icestick.tt"  => "${mod}/icestick.pcf"  # pin constraint file
);

my %vars = (
    module_name  => $mod,
    project_name => $proj
);

print("Creating ${mod} module files.\n");
for my $temp (keys %filemap) {
    print(" +- $filemap{$temp}\n");
    $tt->process($temp, \%vars, $filemap{$temp})
        or die ($tt->error(), "\n");
}
