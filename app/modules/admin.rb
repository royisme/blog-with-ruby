login_notic = 'Invalid username or password'
include AuthHelper::AdminAuth

before '/admintools/:action/' do
	redirect '/admintools' unless authorized?
end

get '/admintools' do
	if authorized?
		redirect '/admintools/'
	end
	slim :admin_login
end

post '/admintools' do
	admin_name = params[:admin_name]
	admin_pass = params[:admin_pass]
	if admin_name!=nil and admin_pass != nil
		if login(admin_name, admin_pass)
			redirect '/admintools/'
		else
			redirect '/admintools'
		end
	end
end
get '/admintools/' do
	redirect '/admintools' unless authorized?
	slim :admintools_index
end
get '/admintools/systools' do
	result = `ls`
end