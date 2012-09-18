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
    require 'config/env'
    Dir[root_path("app/**/*.rb")].each do |file|
        require file
    end
end
