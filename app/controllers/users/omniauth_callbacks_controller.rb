class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def shibboleth
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Shibboleth') if is_navigational_format?
    else
      # TODO: Customize UI flash messages for shibboleth
      set_flash_message(:error, :failure, kind: 'Shibboleth', reason: 'TODO')
      redirect_to new_user_session_path
    end
  end
end
