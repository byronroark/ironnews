require 'sqlite3'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: File.dirname(__FILE__) + "/ironnews.sqlite3"
)

class Stories < ActiveRecord::Base
end
