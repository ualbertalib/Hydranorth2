require 'rails_helper'

RSpec.feature 'Home page' do
  scenario 'visit' do
    visit root_path
    expect(page).to have_title 'Sufia'
  end
end
