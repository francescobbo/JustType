require 'swagger_helper'

describe 'Articles API' do
  before { FactoryGirl.create(:user, :admin, email: 'j@snow.com') }

  path '/admin/articles' do
    get 'Lists all articles' do
      tags 'Articles'
      consumes 'application/json'
      produces 'application/json'
      security [ basic: [] ]

      response '200', 'Success' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :uuid },
                   title: { type: :string },
                   original_content: { type: :string },
                   rendered_content: { type: :string }
                 },
                 required: [ 'id', 'title', 'original_content', 'rendered_content' ]
               }

        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@snow.com:s3cr3t')}" }
        run_test!
      end

      response '403', 'Authentication failed' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:article) { { title: 'foo' } }
        run_test!
      end

      response '401', 'Unauthorized' do
        before { FactoryGirl.create(:user, email: 'j@lannister.com') }

        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:article) { { title: 'foo' } }
        run_test!
      end
    end

    post 'Creates an article' do
      tags 'Articles'
      consumes 'application/json'
      produces 'application/json'
      security [ basic: [] ]

      parameter name: :article,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    title: { type: :string },
                    original_content: { type: :string }
                  },
                  required: [ 'title', 'content' ]
                }

      response '201', 'Article created' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@snow.com:s3cr3t')}" }
        let(:article) { { title: 'foo', original_content: 'bar' } }
        run_test!
      end

      response '422', 'Invalid parameters' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@snow.com:s3cr3t')}" }
        let(:article) { { title: 'foo' } }
        run_test!
      end

      response '403', 'Authentication failed' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:article) { { title: 'foo' } }
        run_test!
      end

      response '401', 'Unauthorized' do
        before { FactoryGirl.create(:user, email: 'j@lannister.com') }

        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:article) { { title: 'foo' } }
        run_test!
      end
    end
  end

  path '/admin/articles/{id}' do
    get 'Retrieves an article' do
      tags 'Articles'
      produces 'application/json'
      security [ basic: [] ]

      parameter name: :id, in: :path, type: :string

      response '200', 'Success' do
        schema type: :object,
               properties: {
                 id: { type: :uuid },
                 title: { type: :string },
                 original_content: { type: :string },
                 rendered_content: { type: :string }
               },
               required: [ 'id', 'title', 'original_content', 'rendered_content' ]

        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@snow.com:s3cr3t')}" }
        let(:id) { FactoryGirl.create(:article).id }
        run_test!
      end

      response '404', 'Article not found' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@snow.com:s3cr3t')}" }
        let(:id) { 'invalid' }
        run_test!
      end

      response '403', 'Authentication failed' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:id) { 'something' }
        run_test!
      end

      response '401', 'Unauthorized' do
        before { FactoryGirl.create(:user, email: 'j@lannister.com') }

        let(:Authorization) { "Basic #{::Base64.strict_encode64('j@lannister.com:s3cr3t')}" }
        let(:id) { 'something' }
        run_test!
      end
    end
  end
end
