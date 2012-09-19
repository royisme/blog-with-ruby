require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'slim'
configure do
    set :environment,:development
	set :run, false
   
    set :static, true
    set :show_exceptions, true
    # set :bind, 'localhost'
    # set :port, 4567 
end