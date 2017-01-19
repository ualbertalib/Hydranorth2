require 'rails_helper'

RSpec.feature 'Home page' do
  scenario 'visit' do
    visit '/'
    expect(page).to have_title 'Sufia'
  end
end
