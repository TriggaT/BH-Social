class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :update]

    def index
        if find_post
            @comments = @post.comments
        elsif find_question
            @comments = @question.comments
        else render :new
        end 
    end 

    
    def new 
        @comment = Comment.new
        if find_post
        elsif find_question
        else render :new
        end 
    end 

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save && @comment.post 
            redirect_to topic_post_path(@comment.topic, @comment.post)
        elsif @comment.save && @comment.question
            redirect_to topic_question_path(@comment.topic, @comment.question)
        else render :new 
        end  
    end 

    def show 
    end 

    def edit
        if find_post
        elsif find_question
        else render :edit
        end 
    end
    
    def update
        if @comment && @comment.post
            @comment.update(comment_params)
            redirect_to topic_post_path(@comment.topic, @comment.post)
        elsif @comment && @comment.quesion
            @comment.update(comment_params) 
            redirect_to topic_question_path(@comment.topic, @comment.question)
        else redirect_to :edit
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