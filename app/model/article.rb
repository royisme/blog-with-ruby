class Article
  include DataMapper::Resource

  property :id,         Serial    # An auto-increment integer key
  property :cid,		Integer
  property :title,      String   ,:length => 50 ,:required => true # A varchar type string, for short strings
  property :body,       Text    ,:required => true # A text block, for longer string data.
  property :created_at, DateTime  ,:required => true# A DateTime, for any date you might like.
  property :author_id,  Integer ,:required => true
  property :reply_num, Integer

  has n, :comments
end
class Tags
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :length => 20, :required=>true

end
class Category
  include DataMapper::Resource
  property :id, Serial
  property :root_id, Integer,:required=>true,:key=>true
  property :name,String, :length => 30, :required=>true
  has n, :article
end
class Comment
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :length => 30, :required=>true
  property :body, String,:length => 300, :required=>true
  property :email,String , :length => 50 ,:required => true
  property :comment_at, DateTime


  belongs_to :article
end
DataMapper.finalize
DataMapper.auto_upgrade!
