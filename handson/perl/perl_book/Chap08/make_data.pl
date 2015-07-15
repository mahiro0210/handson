use strict;
use warnings;
use Data::Dumper 'Dumper';

# ①ハッシュの配列
my $records = [];

# ②行にマッチする正規表現
my $pattern_re = qr/
    ^                      # 先頭
    (\d{4}\/\d{2}\/\d{2})  # 日付
    \s+                    # 区切り
    (\d{1,2}:\d{2}:\d{2})  # 時刻
    \s+                    # 区切り
    "\w+\s+(.+)?"          # URL
    \s+                    # 区切り
    (\d+\.\d+)             # 応答時間
    $                      # 末尾
/x;

# ③各行の処理
while (my $line = <>) {
    
    # ③-1 改行を削除
    chomp $line;
    
    # ③-2 ハッシュのリファレンスを作成
    my $record = {};
    
    # ③-3 正規表現を使って情報を取得
    if ($line =~ /$pattern_re/) {
        $record->{date}     = $1;
        $record->{time}     = $2;
        $record->{url}      = $3;
        $record->{res_time} = $4;
    }
    
    # ③-4 ハッシュの配列に追加
    push @$records, \$record;
}

print Dumper $records;