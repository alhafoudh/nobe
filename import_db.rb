#!/usr/bin/env ruby

require "connect_db"

puts "Importing #{ARGV.first} to #{MY_DB_NAME}"

imported = 0
count = 0
Record.transaction do
  FasterCSV.foreach(ARGV.first, {:col_sep => "\t", :headers => {:first_row => true}}) do |row|
    r = Record.new
    r.recorded_at = Time.at(row[1].to_i)
  
    r.ctime = row[2].to_i
    r.dtime = row[3].to_i
    r.ttime = row[4].to_i
    r.wait = row[5].to_i
  
    imported += 1 if r.save
    r = nil

    count += 1
  end
end

puts "Imported: #{imported}/#{count}"