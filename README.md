ohlife2dayone.pl
================

BooneJS (http://boonejs.tumblr.com)
Use and modify freely, attribution appreciated. Thanks!

Description
-----------

This script works with the Day One command line utility found in the
Application Package. The input to this script is the exported text file
from OhLife.com (https://ohlife.com/export). Clicking the "Export" button
will save a .txt file to ~/Downloads/ohlife_YYYYMMDD.txt.

Script idea was born after reading http://brettterpstra.com/logging-with-day-one-geek-style/

*Please* backup your Day One archive before you attempt to use this script.
Although it works for me, I don't guarantee anything!

Usage
-----

0. Install Day One CLI from the page [Tools | Day One](http://dayoneapp.com/tools/)
1. Save this file someplace (~/Downloads, perhaps?)
2. Open a Terminal in OS X (/Applications/Utilities/Terminal.app)
3. chmod +x ~/Downloads/ohlife2dayone.pl
4. cat ~/Downloads/ohlife_YYYYMMDD.txt | ~/Downloads/ohlife2dayone.pl
