use strict;
use warnings;

# ①モジュールの読み込み
use Time::Local 'timelocal';
use Getopt::Long 'GetOptions';

# ②使用方法
my $usage = "Usage: $0 --start=yyyymmdd:hhmmss --end=yyyymmdd:hhmmss FILE";

# ③コマンドラインオプション
my $start = '';
my $end   = '';
GetOptions(
    'start=s' => \$start,
    'end=s'   => \$end
) or die $usage;


# ④時刻のフォーマット
my $format = qr/^(\d{4})(\d{2})(\d{2}):(\d{2})(\d{2})(\d{2})$/;

# ⑤開始時刻（エポック秒）
my $start_epoch;
if ($start =~ /$format/) {
    my $year = $1;
    my $mon  = $2;
    my $mday = $3;
    
    my $hour = $4;
    my $min  = $5;
    my $sec  = $6;
    
    $start_epoch = timelocal($sec, $min, $hour, 
                             $mday, $mon - 1, $year - 1900);
}

# ⑥終了時刻（エポック秒）
my $end_epoch;
if ($end =~ /$format/) {
    my $year = $1;
    my $mon  = $2;
    my $mday = $3;
    
    my $hour = $4;
    my $min  = $5;
    my $sec  = $6;
    
    $end_epoch = timelocal($sec, $min, $hour, 
                           $mday, $mon - 1, $year - 1900);
}

# ⑦ファイル
my $file = shift;

# ⑧使用方法の表示
die $usage
  unless $start && $end && $file;

# ⑨ファイルオープン
open my $fh, '<', $file
  or die qq{Can't open file "$file": $!};

# ⑩行の読み込み
while (my $line = <$fh>) {

    # ⑩-1 改行の削除
    chomp $line;
    
    # ⑩-2 エポック秒に変換
    my $epoch;
    if ($line =~ m#^(\d{4})/(\d{2})/(\d{2}),(\d{2}):(\d{2}):(\d{2})$#) {
        my $year = $1;
        my $mon  = $2;
        my $mday = $3;
        
        my $hour = $4;
        my $min  = $5;
        my $sec  = $6;
        
        $epoch = timelocal($sec, $min, $hour, 
                           $mday, $mon - 1, $year - 1900);
    }
    
    # ⑩-3 不正なフォーマット
    die qq{Unexpected format: "$line"}
      unless defined $epoch;
    
    # ⑩-4 マッチする時刻の行のみを出力
    print "$line\n"
      if $epoch >= $start_epoch && $epoch < $end_epoch;
}

# ⑪ファイルクローズ
close $fh;