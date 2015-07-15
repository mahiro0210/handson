use strict;
use warnings;

# ①utf8プラグマを有効にする
use utf8;

# ②デコードするためのdecode関数の読み込み
use Encode 'decode';

# ③ファイル名
my $file = shift;

# ④使用方法
die "Usage: $0 FILE" unless defined $file;

# ⑤ファイルオープン
open my $fh, '<', $file
  or die qq{Can't open file "$file": $!};

# ⑥1行ずつ読み込み
while (my $line = <$fh>) {

     # ⑥-1 時刻を内部文字列に変換
     # $line = decode('cp932', $line);
     $line = decode('UTF-8', $line);
     
     # ⑥-2 改行の削除
     chomp $line;
     
     # ⑥-3 時刻と件数を取得
     my ($jtime, $count) = split /\s+/, $line;
     
     # ⑥-4 時、分、秒の取得
     my $hour;
     my $minute;
     my $sec;
     if ($jtime =~ /^(\d{2})時(\d{2})分(\d{2})秒/) {
         $hour   = $1;
         $minute = $2;
         $sec    = $3;
     }
     
     # ⑥-4 hh:mm:dd形式にフォーマット
     my $time = "$hour:$minute:$sec";
     
     # ⑥-5 タブ区切りで時刻と件数を出力
     print join("\t", $time, $count) . "\n";
}

# ⑦ファイルクローズ
close $fh;