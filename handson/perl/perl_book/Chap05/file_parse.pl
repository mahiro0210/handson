use strict;
use warnings;

use File::Basename 'fileparse';
use File::Spec;
use FindBin;

my $log = '/home/hoge/fuga/foo/cpu.log';
my ($log_base, $log_dir, $ext) = fileparse($log, qr/\..+$/);

print "$log_base\n";
print "$log_dir\n";
print "$ext\n";

my $dir = '/home/hoge/fuga/log/cpu.log';
my $file = 'cpu.log';

my $file_abs = File::Spec->catfile($dir, $file);

print "$file_abs\n";

print "$0\n";

my $script_dir = $FindBin::Bin;

print "$script_dir\n";
