# Generated via
#  `rails generate curation_concerns:work GenericWork`
require 'rails_helper'
include Warden::Test::Helpers

RSpec.feature 'Create a GenericWork' do
  context 'a logged in user' do
    let(:user) { create(:user) }

    scenario do
      login_as user
      visit new_curation_concerns_generic_work_path
      fill_in 'Title', with: 'Test GenericWork'
      click_button 'Save'

      expect(page).to have_css 'h1', text: 'Test GenericWork'
      expect(page).to have_css 'div.alert-success', text: 'Your files are being processed by Sufia in the background.'
    end
  end
end
