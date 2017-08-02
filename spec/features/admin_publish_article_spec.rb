require 'rails_helper'

RSpec.feature 'Publishing' do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  before { allow_any_instance_of(Admin::AdminController).to receive(:current_user) { admin } }

  scenario 'Admin publishes an article' do
    visit new_admin_article_path

    within('form') do
      fill_in 'article[title]', with: 'A great article'
      fill_in 'article[original_content]', with: 'Oh my gosh!'
      click_button 'Publish'
    end

    expect(Article.visible.count).to eq 1
  end

  scenario 'Admin saves a draft' do
    visit new_admin_article_path

    within('form') do
      fill_in 'article[title]', with: 'A great article'
      fill_in 'article[original_content]', with: 'Oh my gosh!'
      click_button 'Save Draft'
    end

    expect(Article.visible.count).to eq 0
    expect(Article.count).to eq 1
  end
end
