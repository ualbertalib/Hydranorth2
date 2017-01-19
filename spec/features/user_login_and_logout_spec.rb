require 'rails_helper'

RSpec.feature 'User logs in and logs out' do
  scenario 'with correct CCID credentials' do
    visit '/'

    click_link 'Login'
    expect(page).to have_css('h2', text: 'Login to ERA')
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content 'Sign in with CCID'

    OmniAuth.config.mock_auth[:shibboleth] = OmniAuth::AuthHash.new(
      provider: 'shibboleth',
      uid: 'john.doe@example.com',
      info: {
        email: 'john.doe@example.com',
        display_name: 'John Doe'
      }
    )

    click_link 'Sign in with CCID'

    expect(page).to have_css('h1', text: 'My Dashboard')
    expect(current_path).to eq '/dashboard'
    expect(page).to have_content I18n.t('devise.omniauth_callbacks.success', kind: 'CCID')
    expect(page).to have_content 'John Doe'

    click_link 'Logout'

    expect(current_path).to eq '/'
    expect(page).to have_content I18n.t('devise.sessions.signed_out')
    expect(page).not_to have_content 'John Doe'
  end

  scenario 'with incorrect CCID credentials' do
    visit '/'

    click_link 'Login'
    expect(page).to have_css('h2', text: 'Login to ERA')
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content 'Sign in with CCID'

    OmniAuth.config.mock_auth[:shibboleth] = :invalid_credentials

    click_link 'Sign in with CCID'

    expect(page).to have_css('h2', text: 'Login to ERA')
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content I18n.t('devise.omniauth_callbacks.failure',
                                        kind: 'Shibboleth',
                                        reason: 'Invalid credentials')
  end
end
