require 'rails_helper'

RSpec.feature 'Publishing' do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  before { allow_any_instance_of(Admin::AdminController).to receive(:current_user) { admin } }

  scenario 'Admin publishes a post' do
    visit new_admin_post_path

    within('form') do
      fill_in 'post[title]', with: 'A great article'
      fill_in 'post[original_content]', with: 'Oh my gosh!'
      click_button 'Create Post'
    end

    expect(page).to have_content 'Dashboard'
  end
end
