package MemoryLog::Parser;

use strict;
use warnings;

# ①基底クラスの継承
use base 'Object::Simple';

# ②モジュールの読み込み
use Carp 'croak';

# ③アクセサの定義
__PACKAGE__->attr('total_memory');
__PACKAGE__->attr(header_exists => 1);

# ④ファイルを解析するメソッド
sub parse {
    my ($self, $file) = @_;
    
    # ④-1 ファイルのオープン
    open my $fh, '<', $file
      or die qq{Can't open file "$file": $!};
    
    # ④-2 メモリ使用率の情報
    my $infos = [];
    
    # ④-3 各行の読み込み
    while (my $line = <$fh>) {
        
        # ④-4 ヘッダが存在するときは1行目を飛ばす
        next if $. == 1 && $self->header_exists;
        
        # ④-5 改行の削除
        chomp $line;
        
        # ④-6 時刻とメモリ使用量を取得
        my ($time, $avm) = split /\s+/, $line;
        
        # ④-7 メモリの総量
        my $total_memory = $self->total_memory;
        
        # ④-8 メモリの総量が取得できないときは例外を投げる
        croak "total_memory must be specify"
          unless defined $total_memory;
        
        # ④-9 メモリ使用率
        my $mem = $avm / $total_memory;
        
        # ④-10 情報を追加
        push @$infos, {time => $time, mem => $mem};
    }
    
    # ⑤ファイルのクローズ
    close $fh;

    return $infos;
}

# ⑥真の値を返却
1;