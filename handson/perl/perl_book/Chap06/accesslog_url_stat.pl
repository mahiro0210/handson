use strict;
use warnings;

my $info = {};

# 行の読み込み
while (my $line = <>) {

    # ヘッダを飛ばす
    next if $. == 1;

    # 改行の削除
    chomp $line;

    # 各列の取得
    my ($time, $url, $response_time, $size) = split /\s+/, $line;

    # 回数
    $info->{$url}{count}++;

    # 平均応答時間の合計
    $info->{$url}{response_time_total} += $response_time;

    # サイズの合計
    $info->{$url}{size_total} += $size;
}

# 平均応答時間と平均サイズを求める
foreach my $url (keys %$info) {

    # 各情報
    my $count = $info->{$url}{count};
    my $response_time_total = $info->{$url}{response_time_total};
    my $size_total = $info->{$url}{size_total};

    # 平均応答時間を求める
    my $response_time_average = $response_time_total / $count;
    $response_time_average = sprintf("%.1f",$response_time_average);
    $info->{$url}{response_time_average} = $response_time_average;

    # 平均サイズを求める
    my $size_average = $size_total / $count;
    $size_average = sprintf("%.1f", $size_average);
    $info->{$url}{size_average} = $size_average;
}

# ヘッダの出力
my @headers = qw/url count response_time_average size_average/;
print join("\t", @headers) . "\n";

# 平均応答時間の降順でURLを並び替え
my @urls = sort { $info->{$b}{response_time_average} <=>
        $info->{$a}{response_time_average} } keys %$info;

# 出力
foreach my $url (@urls) {

    # 出力レコード
    my @rec = (
        $url,
        $info->{$url}{count},
        $info->{$url}{response_time_average},
        $info->{$url}{size_average}
    );

    # 出力
    print join("\t", @rec) . "\n";
}
