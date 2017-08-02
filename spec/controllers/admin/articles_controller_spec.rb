require 'rails_helper'

describe Admin::ArticlesController do
  describe '#new' do
    it_behaves_like 'a protected page' do
      let(:action) { :new }
    end
  end

  describe '#create' do
    let(:valid_params) { { article: { title: 'Hello World!', original_content: 'Just another JustType website!' } } }

    it_behaves_like 'a protected page' do
      let(:method) { :post }
      let(:action) { :create }
      let(:params) { valid_params }
    end

    context 'when the admin sends the request' do
      let(:admin) { FactoryGirl.create(:user, :admin) }
      before { allow_any_instance_of(Admin::AdminController).to receive(:current_user) { admin } }

      context 'when the parameters are valid' do
        it 'is creates a new article' do
          expect { post :create, params: valid_params }.to change { Article.count }.by 1
        end
      end

      context 'when the parameters are not valid' do
        it 'does not create a new article' do
          expect { post :create, params: { article: { title: '' } } }.to_not(change { Article.count })
        end
      end

      context 'when the action is publish' do
        it 'sets published on the new article' do
          post :create, params: valid_params.merge(submit_type: 'publish')
          expect(Article.last.published).to be_truthy
        end
      end

      context 'when the params specify a published_at timestamp' do
        it 'sets published on the new article' do
          post :create, params: valid_params.deep_merge(article: { published_at: Date.yesterday })
          expect(Article.last.published).to be_truthy
        end
      end

      context 'when the action is draft' do
        it 'does not set published on the new article' do
          post :create, params: valid_params.merge(submit_type: 'draft')
          expect(Article.last.published).to be_falsey
        end
      end
    end
  end
end
