class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :question

    def topic
        if post 
            post.topic 
        else question 
            question.topic
        end 
    end 





        

end
