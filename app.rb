require 'rubygems'
require 'bundler/setup'
require 'sinatra/base'

ROOT_DIR = File.expand_path( File.dirname(__FILE__) ) unless defined?ROOT_DIR

def root_path(*args)
  File.join(ROOT_DIR, *args)
end
require root_path('config','env.rb')
# Returns the full path to the public folder along with any given additions
# public_path("images")
def public_path(*args)
  root_path('public', *args)
end

class BlogApp < Sinatra::Application
    configure do 
        set :environment,  ENV['RACK_ENV']
        set :root, root_path
        set :datas, root_path("app","data")
        set :helpers, root_path("app","helpers")
        set :images_path, public_path("img")
        set :css_path, public_path('css')
        set :js_path,public_path("js")
        set :modules, root_path("app","modules")
        set :views, root_path("app","views")
        set :public_folder , public_path
        set :sessions,true
    end

    Dir[root_path("app/**/*.rb")].each do |file|
        require file
    end
end
