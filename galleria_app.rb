$: << File.expand_path('../lib', __FILE__)

require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'images'

get '/' do
  haml :index
end