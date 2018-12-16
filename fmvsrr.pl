#!/usr/bin/perl
use strict;
no warnings;
use utf8;

=head1 Description
Configuration Cost Comparison.
BGP as iGP with next-hop-self in a fully connected mesh
vs
BGP as iGP with next-hop-self with 2 Route Reflectors.

=cut

=head1 Author
g0 , L< http://ipduh.com/contact >
=cut

my $USAGE = <<"EOU";
=head1 Usage
% fmvsrr n
Prints a table with the configuration cost for all numbers of routers from 2 to n.
More at http://sl.ipduh.com/fmvsrr

=cut
EOU


my $n= $ARGV[0];


if(@ARGV != 1 || $n !~ /\d+/){
  for my $line (split /\n/,$USAGE){
    print "$line\n" unless ($line =~ /^=.*/);
  }
  exit 3;
}

if($n < 2){
  print "No point in doing any of these setups if there is only one router in the AS.\n";
  exit 0;
}


sub del
{
  print "\t";
}

print <<EOHD;
N    = Number of routers
Πfm  = Maintenance Cost in a Fully Connected Mesh
Πrr  = Maintenance Cost in a Two Route Reflectors Setup
Kfm  = Total Configuration Cost in a Fully Connected Mesh
Krr  = Total Configuration Cost in a Two Route Reflectors Setup
Nfm  = Cost of adding one router in a Fully Connected Mesh
Nrr  = Cost of adding one router in a Two Route Reflectors Setup
EOHD

print "\n\n";
print "N=2\tΠfm=2\tΠrr=2+\tKfm=2\tKrr=2+\tNfm=2\tNrr=2+\n" if($n > 1);
print "N=3\tΠfm=3\tΠrr=3+\tKfm=6\tKrr=3+\tNfm=6\tNrr=3\n" if($n > 2);

if($n > 3){
  for(my $i=4; $i<=$n; $i++){

  print "N=$i";
  del();
  print "Πfm=", ($i*$i-$i)/2;
  del();
  print "Πrr=", $i+2;
  del();
  print "Kfm=", $i*($i-1);
  del();
  print "Krr=", 2*$i+1;
  del();
  print "Nfm=", 2*($i-1);
  del();
  print "Nrr=3\n";

  }
}

exit 0;
