PaxSchedule-To-ICS
==================

This is a Ruby script that parses the PAX schedule page and creates an iCalender file from it.

## Dependencies
    gem install nokogiri
    gem install ri_cal

Tested with Ruby 1.9.3.
	

## Usage

Download the [printed PAX schedule](http://east.paxsite.com/schedule/print) and save it to a file named `data.html`.
Then, run `./pax2ics.rb` to generate an iCalendar file. Run with the `-v` option to show verbose output.

## License
Copyright (c) 2013 Waleed Ahmad & Geoff Shapiro

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


 


