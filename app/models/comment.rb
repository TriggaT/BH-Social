class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :question
    validates :content, presence: true  

    validates :content, length: {maximum: 200}

    def topic
        if post 
            post.topic
        else 
            question.topic
        end 
    end
    




end
