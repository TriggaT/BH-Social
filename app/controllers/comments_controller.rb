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
        else 
            question_or_post
            render :new 
        end  
    end 


    def edit
        if @comment.user == current_user 
            if find_post
            elsif find_question
            end 
        else redirect_to topic_path(@comment.topic) 
        end 
    end
    
    def update
        if @comment && @comment.post
            @comment.update(comment_params)
            redirect_to topic_post_path(@comment.topic, @comment.post)
        elsif @comment && @comment.question
            @comment.update(comment_params) 
            redirect_to topic_question_path(@comment.topic, @comment.question)
        else question_or_post
            redirect_to :edit
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