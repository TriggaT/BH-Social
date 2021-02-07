class UsersController < ApplicationController

    

    def mf_poster
        @user = User.most_frequent_poster
    end 

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else 
            redirect_to new_user_path
        end 

    end 

    def show 
        @user = User.find_by(id: params[:id])
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 


end 