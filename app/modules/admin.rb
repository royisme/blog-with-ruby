get '/admintools' do
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
	if session[:admin_name].epmty? 
		redirect '/admintoosls'
	end
	slim :amdin_index
end