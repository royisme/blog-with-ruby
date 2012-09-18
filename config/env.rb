configure do
    set :environment,:development
#set :run, false
    set :root, root_path
    set :views, root_path("app","views")
    set :modules, root_path("app","modules")
    set :datas, root_path("app","data")
    set :helpers, root_path("app","helpers")
    set :images_path, public_path("images")
    set :static, true
    set :show_exceptions, true
    # set :bind, 'localhost'
    # set :port, 4567 
end