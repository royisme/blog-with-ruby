require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'slim'
configure do
  #  set :environment,:development
	set :run, false
    set :static, false
    set :show_exceptions, true
    # set :bind, 'localhost'
    # set :port, 4567 
    
end
configure :production do
	set :site_assets,'www.royisme.com'
end
configure :development do
	set :site_assets,'127.0.0.1:8080'
end
