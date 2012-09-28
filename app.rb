require 'rubygems'
require 'bundler/setup'
require "debugger"
require 'sinatra'
require 'sinatra/config_file'
require 'slim'
require 'dm-core'
require 'dm-migrations'
require "sinatra/reloader" if development?

ROOT_DIR = File.expand_path( File.dirname(__FILE__) ) unless defined?ROOT_DIR
ENV["RACK_ENV"] ||= "development"

def root_path(*args)
  File.join(ROOT_DIR, *args)
end

def public_path(*args)
  root_path('public', *args)
end


use Rack::Session::Pool, :expire_after => 2592000

configure  do 

    set :root, root_path
    set :run, false
    set :static, true
    set :show_exceptions, true
    set :datas, root_path("app","data")
    set :helpers, root_path("app","helpers")
    set :images_path, public_path("img")
    set :css_path, public_path('css')
    set :js_path,public_path("js")
    set :modules, root_path("app","modules")
    set :views, root_path("app","views")
    set :public_folder , public_path
    set :sessions,false
    set :port, 8080
    set :site_assets,'127.0.0.1:8080'
    set :sql3_URL,"sqlite3://#{settings.datas}/development.db"
end

configure :production do
    set :show_exceptions, false
    set :port, 8486
    set :site_assets,'www.royisme.com'
end

#register Sinatra::ConfigFile
DataMapper.setup(:default, settings.sql3_URL)
def static_path_url(static_file)
    "#{request.scheme}://#{settings.site_assets}#{static_file}"
end
Dir[root_path("app/*/*.rb")].each do |file|
    load file
end
    # sinatra reloader
    # if ENV["RACK_ENV"] == "development"
    #     require "sinatra/reloader"
    #     #p '-------------------------------R-----------------------------------'
    #    # also_reload "app/modules/admin.rb"
    # end
    
# class BlogApp < Sinatra::Application
#     # configure  do 
#     #     # set :environment, ENV['RACK_ENV'] 
#     #     # set :root, root_path
#     #     # set :run, false
#     #     # set :static, true
#     #     # set :show_exceptions, true
#     #     # set :datas, root_path("app","data")
#     #     # # set :helpers, root_path("app","helpers")
#     #     # # set :images_path, public_path("img")
#     #     # # set :css_path, public_path('css')
#     #     # # set :js_path,public_path("js")
#     #     # # set :modules, root_path("app","modules")
#     #     # set :views, root_path("app","views")
#     #     # set :public_folder , public_path
#     #     # set :sessions,false
#     #     # set :port, 8080
#     #     # set :site_assets,'127.0.0.1:8080'
#     #     # set :app_file, __FILE__
#     #     # set :sql3_URL,"sqlite3://#{settings.datas}/development.db"
#     #     # p "development2"
#     #     # p settings.views
#     # end
#     configure :production do
#         set :site_assets,'www.royisme.com'
#         p "production"
#     end
#     register Sinatra::ConfigFile

#     #also_reload settings.views
#     DataMapper.setup(:default, settings.sql3_URL)
#     # Dir[root_path("app/helpers/*.rb")].each do |file|
#     #     require file
#     # end
#     get '/test' do
#         "1234-----777"

#     end 
#     def static_path_url(static_file)
#         "#{request.scheme}://#{settings.site_assets}#{static_file}"
#     end
#     Dir[root_path("app/*/*.rb")].each do |file|
#         load file
#     end
#     run! if app_file == $0
# end