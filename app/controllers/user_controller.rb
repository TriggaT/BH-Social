class UserController < ApplicationController

    def show 
        @user = User.find_by(id: params[:id])
    end 

    def mf_poster
        @user = User.most_frequent_poster
    end 

end 