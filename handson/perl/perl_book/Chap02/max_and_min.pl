use strict;
use warnings;

use Scalar::Util 'looks_like_number';

# ①コマンドライン引数の受け取り
my @nums = @ARGV;

# ②引数が数値がどうかのチェック
foreach my $num (@nums) {
    die "Arguments must be numbers"
      unless looks_like_number($num);
}

# ③最大値を求める
my $max = max(@nums);

# ④最小値を求める
my $min = min(@nums);

# ⑤結果の出力
print "max: $max\n" . 
      "min:$min\n";

# ⑥最大値を求めるサブルーチン
sub max {
    my @nums = @_;

    # ⑥-1 最大値を求める
    my $max;
    foreach my $num (@nums) {
        $max = $num  if !defined $max || $num > $max;
    }
    return $max;
}

# ⑦最小値を求めるサブルーチン
sub min {
    my @nums = @_;

    # ⑦-1 最小値を求める
    my $min;
    foreach my $num (@nums) {
        $min = $num  if !defined $min || $num < $min;
    }
    return $min;
}