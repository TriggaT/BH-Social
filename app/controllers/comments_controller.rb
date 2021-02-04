class CommentsController < ApplicationController
    before_action :find_comment, only: [:show, :edit, :update]

    def index 
        @comments = Comment.all 
        @post = Post.find_by(id: params[:post_id])
    end 

    
    def new 
        @comment = Comment.new
        @post = Post.find_by(id: params[:post_id])
    end 

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save && @comment.post
            redirect_to post_comments_path
        elsif @comment.save && @comment.quesion
            redirect_to question_comments_path
        else redirect_to new_comment_path
        end  
    end 

    def show 
    end 

    def edit
        @post = Post.find_by(id: params[:post_id])
    end
    
    def update
        if @comment && @comment.post
            @comment.update(comment_params)
            redirect_to post_comments_path
        elsif @comment && @@comment.quesion
            @comment.update(comment_params) 
            redirect_to question_comments_path
        else redirect_to new_comment_path
        end  
    end 
    

    private 

    def find_comment
        @comment = Comment.find_by(id: params[:id])
    end 

    def comment_params
        params.require(:comment).permit(:post_id, :question_id, :content)
    end 
end