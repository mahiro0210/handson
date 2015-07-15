use strict;
use warnings;
# use Data::Dumper 'Dumper';

# ‡@2ŸŒ³”z—ñ
my $records = [];

# ‡AŠes‚Ìˆ—
while (my $line = <>) {
    
    # ‡A-1 ‰üs‚ğíœ
    chomp $line;
    
    # ‡A-2 æ“ª‚Ì‹ó”’‚ğíœ
    $line =~ s/^\s+//;
    
    # ‡A-3 ƒŒƒR[ƒh‚ğì¬
    my @record = split(/\s+/, $line);
    
    # ‡A-4 2ŸŒ³”z—ñ‚É’Ç‰Á
    push @$records, \@record;
}

# print Dumper $records;