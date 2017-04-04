class Users::OmniauthCallbacksController < ApplicationController
  # TODO: Remove this once we figure out IST, this is only required for the omniauth developer provider
  skip_before_action :verify_authenticity_token, only: :complete unless (Rails.env.production? && !ENV['ENABLE_TMP_LOGINS'])

  def complete
    auth_hash = request.env['omniauth.auth']

    identity = Identity.find_by(provider: params[:provider], uid: auth_hash.uid)
    user = identity.try(:user)

    if user.blank?
      if auth_hash.info.email.blank?
        return redirect_to new_user_session_path, alert: I18n.t('login.omniauth_error')
      end

      user = User.find_by(email: auth_hash.info.email)

      if user.nil?
        user = User.create(email: auth_hash.info.email,
                           password: Devise.friendly_token[0, 20],
                           display_name: "#{auth_hash.info.name} #{auth_hash.info.last_name}")
      end

      user.identities.create(provider: params[:provider], uid: auth_hash.uid)
    end

    sign_in_and_redirect user, event: :authentication # this will throw if user is not activated
    flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: params[:provider]) if is_navigational_format?
  end

  def failure
    redirect_to new_user_session_path, alert: I18n.t('login.omniauth_error')
  end
end
