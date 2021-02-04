class Question < ApplicationRecord
    belongs_to :user 
    belongs_to :topic 
    has_many :answers, :foreign_key => 'question_id', :class_name => "Comment"
    has_many :comments 
end
