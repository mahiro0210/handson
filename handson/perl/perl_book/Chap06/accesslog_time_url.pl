use strict;
use warnings;

# ①ファイル
my $file = shift;

# ②使用方法
die "Usage: $0 FILE" unless defined $file;

# ③ファイルのオープン
open my $fh, '<', $file
    or die qq{Can't open file "$file": $!};

# ④時刻ごとのURLのカウント数を格納
my $url_infos = {};

# ⑤URLの一覧を格納
my $urls = {};

# ⑥行の読み込み
while (my $line = <$fh>) {
    
    # ⑥-1 改行の削除
    chomp $line;
    
    # ⑥-2 時刻とURLの取得
    my ($time, $url) = split /\s+/, $line;
    
    # ⑥-3 時刻から「時:分」の部分を取得
    my $mtime;
    if ($time =~ /^(\d{2}:\d{2})/) {
        $mtime = $1;
    }
    
    # ⑥-4 アクセス数をカウントアップ
    $url_infos->{$mtime}{$url}++;
    
    # ⑥-5 存在するURLを追加
    $urls->{$url} = 1;
}

# ⑦ファイルのクローズ
close $fh;

# ⑧URLを昇順で並べ替え
my @urls = sort keys %$urls;

# ⑨URL（ヘッダ）の出力
print join("\t", 'time', @urls) . "\n";

# ⑩時刻（分単位）ごとの出力
foreach my $hour (0 .. 23) {
    foreach my $minute (0 .. 59) {
        
        # ⑩-1 出力レコード
        my @rec;
        
        # ⑩-2 時刻を「yy:mm」形式にフォーマット
        my $mtime = sprintf("%02d:%02d", $hour, $minute);
        
        # ⑩-3 時刻をレコードに追加
        push @rec, $mtime;
        
        # ⑩-4 時刻ごとのURLのカウント数をレコードに追加
        foreach my $url (@urls) {
            my $count = $url_infos->{$mtime}{$url} || 0;
            push @rec, $count;
        }
        
        # ⑩-5 レコードを出力
        print join("\t", @rec) . "\n";;
    }
}