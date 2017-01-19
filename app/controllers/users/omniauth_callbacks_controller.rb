class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def shibboleth
    @user = User.from_omniauth(request.env['omniauth.auth'])

    return unless @user.persisted?

    sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
    flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: 'CCID') if is_navigational_format?
  end
end
