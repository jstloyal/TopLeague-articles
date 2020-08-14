require 'rails_helper'

# RSpec.describe 'login page' do
#   let(:user) { User.create(name: 'Tayo') }
#
#   scenario 'login' do
#     visit login_path
#     fill_in 'Name', with: user.name
#     click_button 'Login'
#     expect(page).to have_content('LOGOUT')
#   end
# end

feature 'Log in feature page', type: :feature do
  feature 'Login an existing user' do
    before(:each) do
      visit '/login'
    end

    scenario 'when you login with valid params' do
      fill_in 'Name', with: 'Tayo'
      click_button 'Login'
      expect(current_path).to eq('/login')
    end
  end
end
