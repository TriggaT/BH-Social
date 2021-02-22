class Question < ApplicationRecord
    belongs_to :user 
    belongs_to :topic 
    has_many :answers, :foreign_key => 'question_id', :class_name => "Comment"
    has_many :comments 

    validates :content, presence: true 

    def valid_question
        if !self.content.empty? 
            if self.content.include? "?"
                self.content = self.content.strip
                self   
            else
                self.content = "#{self.content}?"
                self
            end  
        else 
            self 
        end
    end 


end
