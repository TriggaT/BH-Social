class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :update]

    def index 
        @comments = Comment.all 
        set_post
    end 

    
    def new 
        @comment = Comment.new
        if @post 
            set_post
        elsif @question
            find_question
        else redirect_to :back
        end 
    end 

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save && @comment.post 
            redirect_to topic_post_path(@comment.topic, @comment.post)
        elsif @comment.save && @comment.question
            redirect_to topic_question_path(@comment.topic, @comment.question)
        else redirect_to :back
        end  
    end 

    def show 
    end 

    def edit
        if @post 
            set_post
        elsif @question
            find_question
        else redirect_to :back
        end 
    end
    
    def update
        if @comment && @comment.post
            @comment.update(comment_params)
            redirect_to topic_post_path(@comment.topic, @comment.post)
        elsif @comment && @comment.quesion
            @comment.update(comment_params) 
            redirect_to topic_question_path(@comment.topic, @comment.question)
        else redirect_to redirect_to :back
        end  
    end 
    
    private 

    def find_comment
        @comment = Comment.find_by(id: params[:id])
    end 

    def comment_params
        params.require(:comment).permit(:post_id, :question_id, :user_id, :answer, :content)
    end 
end