$: << File.expand_path('../lib', __FILE__)

require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'albums'

ALBUMS = 10

get '/' do
  @albums = Albums.list.take(ALBUMS)
  haml :index
end

get '/page' do
  page = params[:page].to_i
  @albums = Albums.list[page*ALBUMS, ALBUMS]
  haml :page
end