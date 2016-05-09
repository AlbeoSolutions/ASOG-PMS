class RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]
  prepend_before_action :authenticate_scope!, only: [:edit, :update, :destroy]

  def new
    if current_staff.admin == false
      redirect_to pages_error_path
    else
      build_resource()
      render 'new'
    end
  end
  
  def create

      build_resource(sign_up_params)

      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
        # set_flash_message! :notice, :signed_up
          respond_with resource, location: after_sign_up_path_for(resource)
        else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource


  end
  end

  # def after_sign_up_path_for(resource)
  #  'pages/index' # Or :prefix_to_your_route
  # end

  def sign_up_params
    params.require(:staff).permit!
  end

  def account_update_params
    params.require(:staff).permit(:first_name, :last_name, :contract_expiration_date, :email, :password, :password_confirmation, :current_password)
  end

end
