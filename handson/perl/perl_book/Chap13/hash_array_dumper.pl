# ①Data::Dumperモジュールの読み込み
use Data::Dumper 'Dumper';

# ②ハッシュの配列
my $persons = [
    {name => 'Ken', age => 19},
    {name => 'Taro', age => 25}
];

# ③データ
print Dumper $persons;
