module ViewHelper
    def static_path_url(static_file)
    	port = ''
    	port = ":#{request.port}" if request.port != 80 
        "#{request.scheme}://#{request.host}#{port}#{static_file}"
    end
end