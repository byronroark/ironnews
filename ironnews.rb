require 'sqlite3'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader' if development?

set :bind, "0.0.0.0"

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: File.dirname(__FILE__) + "/ironnews.sqlite3"
)

class Story < ActiveRecord::Base
end

configure do
  set :story, Story.new
end

before do
  content_type 'application/json'
  headers 'Access-Control-Allow-Origin' => '*'
end

post '/' do
  story = Story.new
  settings.story = story
end
