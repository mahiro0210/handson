use strict;
use warnings;

# ①ハッシュの宣言と代入：各教科の点数
my %scores = (math => 55, english => 70, japanese => 100);

# 試験結果の表示
foreach my $subject (keys %scores) {
    # 各科目の点数
    my $score = $scores{$subject};

    # ②制御構文：80点以上の場合は「good」
    if ($score >= 80) {
        print "$subject : good\n";
    }
    # ②制御構文60点以上の場合は「pass」
    elsif ($score >= 60) {
        print "$subject : pass\n";
    }
    # ②制御構文それ以外の場合は「failed」
    else {
        print "$subject : failed\n";
    }
}