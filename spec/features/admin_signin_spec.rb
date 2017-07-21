require 'rails_helper'

RSpec.feature "Admin Sign In" do
  let(:admin) { FactoryGirl.create(:user, :admin) }

  scenario 'Successful sign in' do
    visit admin_signin_path

    within("form") do
      fill_in 'email', with: admin.email
      fill_in 'password', with: admin.password
      click_button 'Sign in'
    end

    expect(page).to have_content 'Dashboard'
  end

  scenario 'Failed sign in' do
    visit admin_signin_path

    within("form") do
      fill_in 'email', with: 'random'
      fill_in 'password', with: 'h4xxor'
      click_button 'Sign in'
    end

    expect(page).to have_content 'Invalid email or password'
  end
end
