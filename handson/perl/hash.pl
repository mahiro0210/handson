use strict;
use warnings;

my $students = [
    {num => 1, name => 'aaaa', address => 'hoge1'},
    {num => 2, name => 'bbbb', address => 'hoge2'},
    {num => 3, name => 'cccc', address => 'hoge3'}
];

print "$students->[0]->{name}\n";
print "$students->[0]{name}\n";

push @$students, {num => 4, name => 'dddd', address => 'hoge4'};

print "$students->[3]->{address}\n";

foreach my $student (@$students) {
    my $num = $student->{num};
    my $name = $student->{name};
    my $address = $student->{address};
    print join(',', $num,$name,$address) . "\n";
}
