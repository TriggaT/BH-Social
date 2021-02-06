class QuestionsController < ApplicationController
    
    before_action :find_question, only: [:show, :edit, :update, :solved]

    def index
        find_topic
        @questions = Question.all 
    end 
    
    def new 
        @question = Question.new
        find_topic
    end 

    def create 
        @question = Question.new(question_params)
        if @question.save 
            redirect_to topic_path(params[:topic_id])
        else redirect_to new_topic_question_path(params[:topic_id]) 
        end 
    end 

    def show 
        @comment = Comment.new
        find_topic
    end 

    def edit
        find_topic
    end
    
    def update
        if @question
            @question.update(question_params)
            redirect_to topic_path(params[:topic_id])
        else redirect_to edit_topic_question_path(params[:topic_id], @question) 
        end 
    end 

    def solved 
        @question.answered = true 
        @question.save
        redirect_to topic_question_path(params[:topic_id], @question) 
    end 
    

    private 

    def question_params
        params.require(:question).permit(:user_id, :topic_id, :answered, :content)
    end 
end

