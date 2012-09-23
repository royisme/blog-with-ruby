
get '/admintools' do
	helpers ViewHelper
	# static_path_url('/css/s.js')
	slim :admin_login
end
post '/admintools' do

	admin_name = params[:admin_name]
	admin_pass = params[:admin_pass]
	if :amdin_name!=nil and :admin_pass != nil
		session['admin_name'] = admin_name
		session['admin_pass'] = admin_pass
	end
	nil
end
get '/admintools/' do
	slim :amdin_index
end