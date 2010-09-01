#!/usr/bin/env ruby

require "connect_db"

group = Record.group(:recorded_at)

stat = {}
[:ctime, :dtime, :ttime, :wait].each do |col|
  group.average(col).each do |res|
    stat[res.first] ||= {}
    stat[res.first][col] = res.last
  end
end

puts "ctime\tdtime\tttime\twait"
stat.each do |k, v|
  printf "%d\t%d\t%d\t%d\n", v[:ctime], v[:dtime], v[:ttime], v[:wait]
end