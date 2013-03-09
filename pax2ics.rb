#!/usr/bin/env ruby

require 'nokogiri'
require 'active_support/core_ext'
require 'ri_cal'

data = Nokogiri::HTML(File.open("data.html"))

cal = RiCal.Calendar do |cal|
  data.css('.event').each do |event|
  
    day = event.parent().previous_element().content
  
    date_str = event.parent().parent().css("h2").first().content.to_s().split(" - ").first().split(" ").last()
    
    location = event.css('.upper').first().content.to_s().gsub("[","").gsub("]","")
  
    title = event.css('strong:not(.upper)').first().content 
  
    event.css("p").css("strong").remove
    event.css("p").css(".upper").remove
    time = event.css("p").first().content().to_s().sub(":","").gsub(/^\s+/, "")
  
    start_timestr = date_str + "/" + Time.new.year.to_s() + " " + time.split(" - ").first()
    end_timestr = date_str + "/" + Time.new.year.to_s() + " " + time.split(" - ").last()
  
    start_time = DateTime.strptime(start_timestr,"%m/%d/%Y %I:%M%p")
    end_time   = DateTime.strptime(end_timestr, "%m/%d/%Y %I:%M%p")
    
    if ARGV.first == "-v"
      puts "\033[1;30m::\033[1;36m Parsing event: \033[1;37m #{title} \033[1;30m~\033[1;0m \033[1;32m#{location}\033[1;37m \033[1;30m@\033[1;0m \033[1;31m" + start_time.strftime("%A %B %D %l:%M%P (%k:%M) %Z") + "\033[1;30m - \033[1;31m" + end_time.strftime("%A %B %D %l:%M%P (%k:%M) %Z") + "\033[1;0m"
    end
    
    cal.event do |ev|
      ev.summary = title
      ev.location = location
      ev.dtstart = start_time.getutc
      ev.dtend = end_time.getutc
    end
  
  end
  
end

puts "\033[1;30m:: \033[1;36mParsed " + data.css('.event').length.to_s() + " events. \033[1;0m"

filename = "pax" + Time.new.strftime("%m-%d-%y_%H%M%S") + ".ics"

begin
  file = File.open("#{Dir.pwd}/#{filename}", "w")
  file.write(cal.to_s()) 
  puts "\033[1;30m:: \033[1;32mFile saved to #{filename}!"
rescue IOError => e
  puts "\033[1;30m:: \033[1;31m #{e}"
ensure
  file.close unless file == nil
end