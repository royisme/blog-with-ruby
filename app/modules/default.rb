
get '/' do
	#loadHeaderHtml
	slim :index ,:locals => { :author => 'value',:year=>2012}	
end
