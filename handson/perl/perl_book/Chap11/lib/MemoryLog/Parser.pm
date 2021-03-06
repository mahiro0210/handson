package MemoryLog::Parser;

use strict;
use warnings;

# �@基底クラスの継承
use base 'Object::Simple';

# �Aモジュールの読み込み
use Carp 'croak';

# �Bアクセサの定義
__PACKAGE__->attr('total_memory');
__PACKAGE__->attr(header_exists => 1);

# �Cファイルを解析するメソッド
sub parse {
    my ($self, $file) = @_;
    
    # �C-1 ファイルのオープン
    open my $fh, '<', $file
      or die qq{Can't open file "$file": $!};
    
    # �C-2 メモリ使用率の情報
    my $infos = [];
    
    # �C-3 各行の読み込み
    while (my $line = <$fh>) {
        
        # �C-4 ヘッダが存在するときは1行目を飛ばす
        next if $. == 1 && $self->header_exists;
        
        # �C-5 改行の削除
        chomp $line;
        
        # �C-6 時刻とメモリ使用量を取得
        my ($time, $avm) = split /\s+/, $line;
        
        # �C-7 メモリの総量
        my $total_memory = $self->total_memory;
        
        # �C-8 メモリの総量が取得できないときは例外を投げる
        croak "total_memory must be specify"
          unless defined $total_memory;
        
        # �C-9 メモリ使用率
        my $mem = $avm / $total_memory;
        
        # �C-10 情報を追加
        push @$infos, {time => $time, mem => $mem};
    }
    
    # �Dファイルのクローズ
    close $fh;

    return $infos;
}

# �E真の値を返却
1;