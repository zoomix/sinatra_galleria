require 'rubygems'
require 'sinatra'
 
set :public_folder, File.expand_path(File.dirname(__FILE__) + '/public') # Include your public folder
set :views, File.expand_path(File.dirname(__FILE__) + '/views')  # Include the views
 
set :environment, :production
 
disable :run, :reload
 
require './galleria_app' # replace this with your sinatra app file
run Sinatra::Application