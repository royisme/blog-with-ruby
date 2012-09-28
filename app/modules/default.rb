
get '/' do
# 	@post = Article.create(
#   :title      => "My first DataMapper post",
#   :body       => "A lot of text ...",
#   :created_at => Time.now
# )
# 	@post.save   
	@zoos_by_tiger_count = Article.all(:order => [ :id.desc ])
	p @zoos_by_tiger_count[0][:id]
	slim :index 
end