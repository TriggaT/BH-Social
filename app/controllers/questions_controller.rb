class QuestionsController < ApplicationController
    
    before_action :find_question, only: [:show, :edit, :update, :solved]
    before_action :find_topic, only:[:index, :new, :show, :edit]

    def index
        @questions = Question.all 
    end 
    
    def new 
        @question = Question.new
    end 

    def create 
        @question = Question.new(question_params)
        @question.valid_question
        if @question.save
            redirect_to topic_question_path(params[:question][:topic_id], @question)
        else 
            flash.now[:messages] = @question.errors.full_messages
            render :new 
        end 
    end 

    def show 
        @comment = Comment.new
    end 

    def edit
    end
    
    def update
        if @question
            @question.update(question_params)
            redirect_to topic_question_path(params[:question][:topic_id], @question)
        else 
            flash.now[:messages] = @question.errors.full_messages
            render :edit 
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

