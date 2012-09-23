#\ -p 8080
require File.join(File.dirname(__FILE__), 'app')
set :run, false
set :environment, :development
run BlogApp
