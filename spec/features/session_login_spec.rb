require 'rails_helper'

RSpec.describe 'login page' do
  let(:user) { User.create(name: 'Tayo') }

  scenario 'login page' do
    visit login_path
    fill_in 'Name', with: user.name
    click_button 'Login'
    expect(page).to have_content('LOGOUT')
  end
end
