class Topic < ApplicationRecord
    has_many :posts 
    has_many :comments, through: :posts
    has_many :questions  
    has_many :users, through: :questions

   
end
