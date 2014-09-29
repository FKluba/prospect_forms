class Post
  include MongoMapper::Document

  key :title, String
  key :content, String
  key :user_id, ObjectId

  belongs_to :user 

  has_many :posts




# @user = User.find(3)
# @posts = @user.posts # Post.where(:user_id => @user.id)





end
