class User < ApplicationRecord
  has_many :posts
  has_many :comments_to_posts, :through => :posts, source: :comments 
  has_many :comments_to_questions, :through => :questions, source: :comments
  has_many :questions
  has_many :topics, through: :posts
  has_many :comments 
  validates :name, :email, :password,  presence: true
  validates :name, :email, uniqueness: true

  has_secure_password

  def self.most_frequent_poster
    joins(:topics).group("user_id").order('count(posts.id) DESC').first 
  end 

  def self.create_with_omniauth(auth) 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = auth['credentials']['token']
    end
  end


    

end
