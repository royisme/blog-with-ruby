
module AuthHelper
  module AdminAuth
    config_file(File.join(ROOT_DIR ,'config/admin.yaml'))
    @@name = settings.admin[:name]
    @@pass = settings.admin[:pass]

    def authorized?
      session[:authorized] 
    end

    def logout!
      session[:authorized] = false
    end

    def login(name,pass)
      if name == @@name && pass == @@pass
        session[:authorized] = true
        return true
      else
        session[:authorized] = false
        return false
      end
    end
  end
  helpers AdminAuth

end
#
  #   def initialize
  #     config_file(File.join(ROOT_DIR ,'config/admin.yaml'))
  #     # @name = settings.admin[:name]
  #     # @pass = settings.admin[:pass]
  #   end
    
  #   def authorized?
  #     #session[:authorized]
  #     "hhhhh"
  #   end
    
  #   def logout!
  #     session[:authorized] = false
  #   end
    
  #   def login(name,pass)
  #     if name == @name && pass == @pass
  #       session[:authorized] = true
  #       return true
  #     else
  #       session[:authorized] = false
  #       return false
  #     end
  #   end
  # end
#  helpers AdminAuth
#end

  #   def config_for_env(hash)
  #     if hash.respond_to? :keys and hash.keys.all? { |k| environments.include? k.to_s }
  #        hash = hash[environment.to_s] || hash[environment.to_sym]
  #     end
 
  #     if hash.respond_to? :to_hash
  #        indifferent_hash = Hash.new {|hash,key| hash[key.to_s] if Symbol === key }
  #        indifferent_hash.merge hash.to_hash
  #     else
  #        hash
  #     end
  #   end

  #   def config_file(*paths)
  #        Dir.chdir(root || '.') do
  #         paths.each do |pattern|
  #          Dir.glob(pattern) do |file|
  #            $stderr.puts "loading config file '#{file}'" if logging?
  #            yaml = config_for_env(YAML.load_file(file)) || {}
  #            yaml.each_pair do |key, value|
  #              for_env = config_for_env(value)
  #              set key, for_env unless value and for_env.nil? and respond_to? key
  #            end
  #          end
  #        end
  #      end
  #    end
  # end

#  Sinatra.register AuthHelper::AdminAuth


# module Sinatra
#   module SessionAuth

#     module Helpers
#       def authorized?
#         session[:authorized]
#       end

#       def authorize!
#         redirect '/login' unless authorized?
#       end

#       def logout!
#         session[:authorized] = false
#       end
#     end

#     def self.registered(app)
#       app.helpers SessionAuth::Helpers

#       app.set :username, 'frank'
#       app.set :password, 'changeme'

#       app.get '/login' do
#         "<form method='POST' action='/login'>" +
#         "<input type='text' name='user'>" +
#         "<input type='text' name='pass'>" +
#         "</form>"
#       end

#       app.post '/login' do
#         if params[:user] == options.username && params[:pass] == options.password
#           session[:authorized] = true
#           redirect '/'
#         else
#           session[:authorized] = false
#           redirect '/login'
#         end
#       end
#     end
#   end

#   register SessionAuth
# end