# if
if ($bool) {
    # 処理
}

# foreach
foreach my $num (@nums) {
    # 処理
}

# for
my @nums = (1, 2, 3, 4, 5);
for (my $i = 0; $i < 5; $i++) {
    print $nums[$i];
}

# サブルーチン
sub name {
    my ($file, $type) = @_;
    # 処理
    return $ret;
}