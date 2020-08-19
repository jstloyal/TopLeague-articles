require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
  let(:user) { User.create!(name: 'Akanmu') }

  scenario 'signup page user already taken' do
    visit '/signup'
    fill_in 'Name', with: user.name
    click_button 'Register'
    expect(page).to have_content('User not created please try another name.')
  end
end
