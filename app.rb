require 'rubygems'
require 'bundler/setup'
require 'sinatra'

ROOT_DIR = File.expand_path( File.dirname(__FILE__) ) unless defined?ROOT_DIR

def root_path(*args)
  File.join(ROOT_DIR, *args)
end

# Returns the full path to the public folder along with any given additions
# public_path("images")
def public_path(*args)
  root_path('public', *args)
end
class BlogApp < Sinatra::Application
  #  configure do
    set :environment,:development
#set :run, false
    set :root, root_path
    set :views, root_path("app","views")
    set :modules, root_path("app","modules")
    set :images_path, public_path("images")
    set :static, true
    set :show_exceptions, true
    set :bind, 'localhost'
    set :port, 4567 
    Dir[root_path("app/**/*.rb")].each do |file|
        require file
    end
end
