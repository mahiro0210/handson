use strict;
use warnings;

my $message = 'Hello';
my @nums = (1, 2, 3);
my %scores = (math => 80, english => 77);

my $twice = twice(5);

# ブレークポイント
$DB::single = 1;

foreach my $num (@nums) {
    
    # 条件付きブレークポイント
    if ($num == 2) { $DB::single = 1 }
    print "$num\n";
}

sub twice {
    my $num = shift;
    
    return $num * 2;
}
