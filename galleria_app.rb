$: << File.expand_path('../lib', __FILE__)

require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'albums'

get '/' do
  haml :index
end