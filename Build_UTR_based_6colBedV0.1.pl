# 6 col Bed ,flanking 2K

open (IN,"$ARGV[0]");
open (UTR5,">5UTR.bed");
open (UTR3,">3UTR.bed");
#A01	15705	19194	Gh_A01G0001	100	+
while (<IN>) {
 @a=split("\t",$_);
if ($a[5]=~/\+/) {
   $UTR_5start = $a[1]-2000;
   if ($UTR_5start < 0) { $UTR_5start = 0;}
print UTR5 $a[0]."\t".$UTR_5start."\t$a[1]\t$a[3]\t0\t\+\n";
$UTR_5end= $a[2]+2000;

print UTR3 $a[0]."\t".$a[2]."\t$UTR_5end\t$a[3]\t0\t\+\n";
}
else {
$UTR_5start=$a[2]+2000;
print UTR5 $a[0]."\t".$a[2]."\t".$UTR_5start."\t".$a[3]."\t"."0\t-\n";
$UTR_3end= $a[1]-2000;
if ($UTR_3end < 0) { $UTR_3end = 0;}
print UTR3 $a[0]."\t".$UTR_3end."\t$a[1]\t$a[3]\t0\t\-\n";
}	# body...
}