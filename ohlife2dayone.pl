#!/usr/bin/env perl

# ohlife2dayone.pl
# BooneJS (http://boonejs.tumblr.com)
# Use and modify freely, attribution appreciated
# 
# This script works with the Day One command line utility found in the
# Application Package. The input to this script is the exported text file
# from OhLife.com (https://ohlife.com/export). Clicking the "Export" button 
# will save a .txt file to ~/Downloads/ohlife_YYYYMMDD.txt.
#
# Script idea was born after reading http://brettterpstra.com/logging-with-day-one-geek-style/
#
# Usage:
# 1. Save this file someplace (~/Downloads, perhaps?)
# 2. Open a Terminal in OS X (/Applications/Utilities/Terminal.app)
# 3. chmod +x ~/Downloads/ohlife2dayone.pl
# 4. cat ~/Downloads/ohlife_YYYYMMDD.txt | ~/Downloads/ohlife2dayone.pl


use warnings;
use strict;

my $time = "8:00PM"; # default time for Day One

my $savedDate = "";
my $message = "";
my $justCapturedDate = 0;

while(<>) {
	my $line = $_;
	
	# Exported file is in DOS format; remove any excess carriage returns
	$line =~ s/\r//g;
	
	# If the line contains a date, 
	if($line =~ /(\d{4}-\d{2}-\d{2})/) {
		# Reached a new date. If there's a current date, call dayone and enter the information.
		chomp($line);
		if($savedDate ne "") {
			system("echo \"$message\" | /Applications/\"Day One.app\"/Contents/MacOS/dayone -d=\"$savedDate $time\" new") ;
		}
		
		# If date is specified as YYYY-MM-DD, dayone seems to assume date/time is UTC and subtract for your timezone.
		# For instance, UTC -6 (Central Time Zone), so 8:00PM shows up at 2:00PM in Day One.
		# However, YYYY/MM/DD seems to assume date/time is current time zone.
		$line =~ s/-/\//g;

		$savedDate = $line;
		$message = ""; # reset message
		$justCapturedDate = 1;
	}
	else {
		if ($justCapturedDate == 1 ) {
			$justCapturedDate = 0;
			next;
		}
		# Need to escape any " in $line, otherwise system() will interpret it as the end of the string to execute.
		$line =~ s/"/\\"/g;
		
		# Append string to the message.
		$message = $message . $line . "\n";
	}
}
