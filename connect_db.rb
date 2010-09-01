require "rubygems"
require "sqlite3"
require "active_record"
require "fastercsv"
require "pp"

# connect to database.  This will create one if it doesn't exist
MY_DB_NAME = "stat/stat.db"
MY_DB = SQLite3::Database.new(MY_DB_NAME)

# puts "Connecting to database #{MY_DB_NAME}"

# get active record set up
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => MY_DB_NAME)

# create your AR class
class Record < ActiveRecord::Base
end

if !Record.table_exists?
  ActiveRecord::Base.connection.create_table(:records) do |t|  
    t.column :recorded_at, :timestamp
    t.column :ctime, :integer
    t.column :dtime, :integer
    t.column :ttime, :integer
    t.column :wait, :integer
  end
end