require 'sinatra'
require 'haml'
require_relative 'lib/images'

get '/' do
  haml :index
end