class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    belongs_to :question
    has_one :topic, through: :post
    has_one :topic, through: :question


        

end
