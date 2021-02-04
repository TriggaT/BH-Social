class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]

    def index
        @posts = Post.all 
    end 
    
    def new 
        @post = Post.new
        @topic = Topic.find_by(id: params[:topic_id])
    end 

    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to topic_path(params[:topic_id])
        else redirect_to new_topic_post_path(params[:topic_id]) 
        end 
    end 

    def show 
        @topic = Topic.find_by(id: params[:topic_id])
        @comment = Comment.new
    end 

    def edit
        @topic = Topic.find_by(id: params[:topic_id])
     
    end
    
    def update
        if @post
            @post.update(post_params)
            redirect_to topic_path(params[:topic_id])
        else redirect_to edit_topic_post_path(params[:topic_id], @post) 
        end  
    end 



        


    private 

    def set_post
        @post = Post.find_by(id: params[:id])
    end 

    def post_params
        params.require(:post).permit(:user_id, :title, :topic_id, :content)
    end 
end
