class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update]
    before_action :find_topic, only:[:index, :new, :show, :edit]

    def index
        @posts = Post.all 
    end 
    
    def new 
        @post = Post.new
        
    end 

    def create 
        @post = Post.new(post_params)
        if @post.save 
            redirect_to topic_post_path(params[:post][:topic_id], @post)
        else 
            flash.now[:messages] = @post.errors.full_messages
            render :new 
        end 
    end 

    def show 
        @comment = Comment.new
    end 

    def edit
    end
    
    def update
        if @post
            @post.update(post_params)
            redirect_to topic_post_path(params[:post][:topic_id], @post)
        else
            flash.now[:messages] = @post.errors.full_messages
            render :edit  
        end  
    end 

    private 

    def post_params
        params.require(:post).permit(:user_id, :title, :topic_id, :content)
    end 
end
