require "sinatra"

helpers do
	def bbb 
		p "hellO"
	end
end
get '/' do
bbb
end 	
