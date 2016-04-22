class RegistrationsController < Devise::RegistrationsController

  # def after_sign_up_path_for(resource)
  #  'pages/index' # Or :prefix_to_your_route
  # end

  def sign_up_params
    params.require(:staff).permit(:first_name, :last_name, :contract_expiration_date, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:staff).permit(:first_name, :last_name, :contract_expiration_date, :email, :password, :password_confirmation, :current_password)
  end

end
