get '/' do
	#loadHeaderHtml
	helpers ViewHelper

	slim :index ,:locals => { :author => 'value',:year=>2012}	
end
