require 'rails_helper'

describe Admin::PostsController do
  describe '#new' do
    it_behaves_like 'a protected page' do
      let(:action) { :new }
    end
  end

  describe '#create' do
    let(:valid_params) { { post: { title: 'Hello World!', original_content: 'Just another JustType website!' } } }

    it_behaves_like 'a protected page' do
      let(:method) { :post }
      let(:action) { :create }
      let(:params) { valid_params }
    end

    context 'when the admin sends the request' do
      let(:admin) { FactoryGirl.create(:user, :admin) }
      before { allow_any_instance_of(Admin::AdminController).to receive(:current_user) { admin } }

      context 'when the parameters are valid' do
        it 'is creates a new post' do
          expect { post :create, params: valid_params }.to change { Post.count }.by 1
        end
      end

      context 'when the parameters are not valid' do
        it 'does not create a new post' do
          expect { post :create, params: { post: { title: '' } } }.to_not change { Post.count }
        end
      end
    end
  end
end
