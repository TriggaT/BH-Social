class RegistrationsController < Devise::RegistrationsController

  def show 
    @user = User.find_by(id: params[:id])
  end 

  def destroy 
    sign_out_user 
  end 

    

    private
  
    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end

end