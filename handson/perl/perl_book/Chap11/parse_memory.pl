use strict;
use warnings;

# ①ライブラリのパスの追加
use FindBin;
use lib "$FindBin::Bin/lib";

# ②モジュールの読み込み
use MemoryLog::Parser;
use Data::Dumper 'Dumper';

# ③ファイル
my $file = shift;

# ④MemoryLog::Parserオブジェクトの生成
my $parser = MemoryLog::Parser->new(total_memory => 60000);

# ⑤ファイルの解析
my $mem_infos = $parser->parse($file);

# ⑥データの出力
print Dumper $mem_infos;