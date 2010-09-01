#!/usr/bin/env ruby

require "connect_db"

group = Record.group(:recorded_at)

stat = {}

group.count.each do |res|
  stat[res.first] ||= {}
  stat[res.first] = res.last
end

puts "count"
stat.each do |k, v|
  puts v
end