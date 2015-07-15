use strict;
use warnings;

# ㈰ファイル名
my $file = shift;

# ㈪使用方法
die "Usage: $0 FILE"  unless defined $file;

# ㈫ファイルのオープン
open my $fh, '<', $file
  or die qq{Can't open file: "$file": $!};

# ㈬複数のパケット情報を格納するための配列のリファレンス
my $packet_infos = [];

# ㈭パケット情報を格納するためのハッシュのリファレンス
my $packet_info;

# ㈮各行の処理
while (my $line = <$fh>) {
    
    # ㈮-1 改行の削除
    chomp $line;
    
    # ㈮-2 行ごとに場合分け
    if ($line =~ /^(\d{2}:\d{2}:\d{2})/) {
        
        # ㈮-3 パケット情報の初期化
        $packet_info = {};
        
        # ㈮-4 時刻
        $packet_info->{time} = $1;
    }
    elsif ($line =~ /^packet: (\d+)/) {
        
        # ㈮-5 パケット数
        $packet_info->{packet} = $1;
    }
    elsif ($line =~ /^loss: (\d+)/) {
        
        # ㈮-6 ロス数
        $packet_info->{loss} = $1;
        
        # ㈮-7 パケット情報を追加
        push @$packet_infos, $packet_info;
    }
}

# ㈯ファイルのクローズ
close $fh;

# ㉀ヘッダの出力
my @headers = qw/time packet loss/;
print join("\t", @headers) . "\n";

# ㈷出力処理
foreach my $packet_info (@$packet_infos) {
    
    # ㈷-1 レコードの作成
    my @rec = (
        $packet_info->{time},
        $packet_info->{packet},
        $packet_info->{loss}
    );
    
    # ㈷-2 タブ区切りで出力
    print join("\t", @rec) . "\n";
}
