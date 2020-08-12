require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
  scenario 'signup page' do
    visit signup_path
    fill_in 'Name', with: 'temitayo'
    click_button 'Register'
    expect(page).to have_content('temitayo')
  end
end
