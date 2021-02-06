class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]

    def index
        find_topic
        @posts = Post.all 
    end 
    
    def new 
        @post = Post.new
        find_topic
    end 

    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to topic_path(params[:topic_id])
        else redirect_to new_topic_post_path(params[:topic_id]) 
        end 
    end 

    def show 
        find_topic
        @comment = Comment.new
    end 

    def edit
        find_topic
    end
    
    def update
        binding.pry 
        if @post
            @post.update(post_params)
            redirect_to topic_path(params[:topic_id])
        else redirect_to edit_topic_post_path(params[:topic_id], @post) 
        end  
    end 

    private 

    def post_params
        params.require(:post).permit(:user_id, :title, :topic_id, :content)
    end 
end
