
# #include AuthHelper::AdminAuth
# #helpers do 
#     config_file(File.join(ROOT_DIR ,'config/admin.yaml'))
#     @@name = settings.admin[:name]
#     @@pass = settings.admin[:pass]

#     def authorized?
#       session[:authorized] 
#     end

#     def logout!
#       session[:authorized] = false
#     end

#     def login(name,pass)
#       if name == @@name && pass == @@pass
#         session[:authorized] = true
#         return true
#       else
#         session[:authorized] = false
#         return false
#       end
#     end
# #end


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