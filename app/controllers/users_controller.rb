class UsersController < ApplicationController

    


    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else 
            flash.now[:messages] = @user.errors.full_messages
            render :new 
        end 

    end 

    def show 
        if params[:id] == "most-frequent-poster"
            @user = User.most_frequent_poster
            render :mf_poster
        else 
        @user = User.find_by(id: params[:id])
        end 
    end 

    def index
        redirect_to new_user_path 
    end 

    def mf_poster
        @user = User.most_frequent_poster
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end 


end 