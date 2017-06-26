class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def sign_up_params
    params.require(:user).permit(:username, :user_id, :email, :password, :password_confirmation, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:username, :user_id, :email, :password, :password_confirmation, :current_password)
  end

  # GET /resource/sign_up
   def new
     super
     @avatars = [{:id => 1, :image =>"avatar_1"},{:id => 2, :image =>"avatar_2"},{:id => 3, :image =>"avatar_3"},
      {:id => 4, :image =>"avatar_4"},{:id => 5, :image =>"avatar_5"},{:id => 6, :image =>"avatar_6"},
      {:id => 7, :image =>"avatar_7"},{:id => 8, :image =>"avatar_8"}]
   end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #    super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  #   def after_sign_up_path_for(resource)
  #    super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
