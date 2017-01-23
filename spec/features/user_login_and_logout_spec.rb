require 'rails_helper'

RSpec.feature 'User logs in and logs out' do
  scenario 'with correct CCID credentials' do
    visit root_path

    click_link 'Login'
    expect(page).to have_css('h1', text: I18n.t('devise.sessions.new.header'))
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content I18n.t('devise.sessions.new.login_button_text')

    OmniAuth.config.mock_auth[:shibboleth] = OmniAuth::AuthHash.new(
      provider: 'shibboleth',
      uid: 'john.doe@example.com',
      info: {
        email: 'john.doe@example.com',
        display_name: 'John Doe'
      }
    )

    click_link I18n.t('devise.sessions.new.login_button_text')

    expect(page).to have_css('h1', text: 'My Dashboard')
    expect(current_path).to eq Sufia::Engine.routes.url_helpers.dashboard_index_path
    expect(page).to have_content I18n.t('devise.omniauth_callbacks.success', kind: 'CCID')
    expect(page).to have_content 'John Doe'

    click_link 'Logout'

    expect(current_path).to eq root_path
    expect(page).to have_content I18n.t('devise.sessions.signed_out')
    expect(page).not_to have_content 'John Doe'
  end

  scenario 'with incorrect CCID credentials' do
    visit root_path

    click_link 'Login'
    expect(page).to have_css('h1', text: I18n.t('devise.sessions.new.header'))
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content I18n.t('devise.sessions.new.login_button_text')

    OmniAuth.config.mock_auth[:shibboleth] = :invalid_credentials

    click_link I18n.t('devise.sessions.new.login_button_text')

    expect(page).to have_css('h1', text: I18n.t('devise.sessions.new.header'))
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content I18n.t('devise.omniauth_callbacks.failure',
                                        kind: 'Shibboleth',
                                        reason: 'Invalid credentials')
  end

  scenario 'when accessing a protected page it redirects back to same page after login' do
    visit Sufia::Engine.routes.url_helpers.notifications_path

    expect(page).to have_content I18n.t('devise.failure.unauthenticated')
    expect(current_path).to eq(new_user_session_path)

    OmniAuth.config.mock_auth[:shibboleth] = OmniAuth::AuthHash.new(
      provider: 'shibboleth',
      uid: 'john.doe@example.com',
      info: {
        email: 'john.doe@example.com',
        display_name: 'John Doe'
      }
    )

    click_link I18n.t('devise.sessions.new.login_button_text')

    expect(page).to have_css('h1', text: 'User Notifications')
    expect(current_path).to eq Sufia::Engine.routes.url_helpers.notifications_path
    expect(page).to have_content I18n.t('devise.omniauth_callbacks.success', kind: 'CCID')
    expect(page).to have_content 'John Doe'
  end
end
