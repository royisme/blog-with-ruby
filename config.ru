require File.join(File.dirname(__FILE__), 'app.rb')
#FileUtils.mkdir_p 'log' unless File.exists?('log')
#log = File.new("log/sinatra.log", "a")
#$stdout.reopen(log)
#$stderr.reopen(log)

run Sinatra::Application
