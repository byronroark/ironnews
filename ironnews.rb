require 'sqlite3'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'erb'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: File.dirname(__FILE__) + "/ironnews.sqlite3"
)

class Author < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  has_many :stories
  validates :name, presence: true
  validates :email, presence: true, format: VALID_EMAIL_REGEX
end

class Story < ActiveRecord::Base
  belongs_to :author
  validates :link, presence: true
  validates :title, presence: true
end

get '/' do
  per_page = 10

  if params[:page]
    page_offset = per_page * (params[:page].to_i - 1)
    @prev_page = params[:page].to_i - 1
    @next_page = params[:page].to_i + 1
  else
    page_offset = 0
    @prev_page = nil
    @next_page = 2
  end

  @stories = Story.all.order('created_at desc').offset(page_offset).limit(10)
  erb :index
end
