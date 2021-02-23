class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :github 
    

  def new
      @user = current_user ||  User.new
  end 

  def create
      @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to root_path
      else
        flash.now.alert = "Invalid name or password"
          render :new
      end  
          
  end
  
  def github
    @user = User.create_with_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id 
    redirect_to root_path
  end 

  def destroy
      session.delete :user_id 
      redirect_to login_path
  end 

  
end