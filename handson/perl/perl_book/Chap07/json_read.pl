use JSON 'decode_json';

my $data = decode_json(get_content('conf.json'));

# ファイルの内容を取得する関数
sub get_content {
    my $file = shift;

    open my $fh, '<', $file
        or die qq{Can't open file "$file": $!};

    return join '', <$fh>;
}