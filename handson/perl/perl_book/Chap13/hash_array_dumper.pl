# �@Data::Dumperモジュールの読み込み
use Data::Dumper 'Dumper';

# �Aハッシュの配列
my $persons = [
    {name => 'Ken', age => 19},
    {name => 'Taro', age => 25}
];

# �Bデータ
print Dumper $persons;
