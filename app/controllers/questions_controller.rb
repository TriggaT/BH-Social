class QuestionsController < ApplicationController
    
    before_action :find_question, only: [:show, :edit, :update, :solved]

    def index
        @questions = Question.all 
    end 
    
    def new 
        @question = Question.new
        @topic = Topic.find_by(id: params[:topic_id])
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
        @topic = Topic.find_by(id: params[:topic_id])
    end 

    def edit
        @topic = Topic.find_by(id: params[:topic_id])
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

    def find_question
        @question = Question.find_by(id: params[:id])
    end 

    def question_params
        params.require(:question).permit(:user_id, :topic_id, :answered, :content)
    end 
end

