class SessionsController < ApplicationController
    

  def new
      @user = current_user ||  User.new
  end 

  def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to root_path
      else
          flash[:alert] = "Your password is incorrect"
          redirect_to login_path
      end  
          
  end 

  def destroy
      session.delete :user_id 
      redirect_to login_path
  end 

  
end