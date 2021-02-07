class User < ApplicationRecord
  has_many :posts
  has_many :comments_to_posts, :through => :posts, source: :comments 
  has_many :questions
  has_many :topics, through: :posts
  has_many :comments 

  has_secure_password

  def self.most_frequent_poster
    joins(:topics).group("user_id").order('count(posts.id) DESC').first 
  end 


    

end
