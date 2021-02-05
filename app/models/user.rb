class User < ApplicationRecord
  has_many :posts
  has_many :comments_to_posts, :through => :posts, source: :comments 
  has_many :questions
  has_many :topics, through: :posts
  has_many :comments 

  def self.most_frequent_poster
    joins(:topics).group("user_id").order('count(posts.id) DESC').first 
  end 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]
  
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end 
  end  

    

end
