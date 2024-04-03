#!C:\perl64\bin\perl.exe

my $dir = '.\\log\\';
my @files = `dir "$dir" /B`;
my %dates_count = ();
print ("Content-type: text/plain; charset=utf-8\n\n");
foreach $file (@files) {
	if ($file !~ /^\s*$/) {
		open ($f, $dir . $file) || die 'Файл не найден';
		my @strings = <$f>;

		foreach $string (@strings) {
			if ($string =~ /^(.{10}).*Database was not shutdown normally!$/) {
				$dates_count{$1}++;
			}
		}

		for $date (keys(%dates_count)) {
			print "At $date was $dates_count{$date} errors.\n";
		}
	}
}