require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:article)).to be_valid
  end

  it { is_expected.to belong_to :author }
  it { is_expected.to belong_to :category }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :rendered_content }

  context 'on creation' do
    context 'when a slug is specified' do
      it 'maintains the given slug' do
        article = FactoryGirl.create(:article, slug: 'i-am-a-slug')
        expect(article.slug).to eq 'i-am-a-slug'
      end
    end

    context 'when the slug is left empty' do
      it 'generates a slug' do
        article = FactoryGirl.create(:article, title: 'I am a title')
        expect(article.slug).to eq 'i-am-a-title'
      end
    end
  end

  describe '#publish' do
    context 'when the published_at timestamp is nil' do
      it 'sets the published_at timestamp' do
        article = FactoryGirl.build(:article, published_at: nil)
        article.publish

        expect(article.published_at).to be_within(1.second).of Time.now.utc
      end
    end

    context 'when the published_at timestamp is set' do
      it 'does not replace it' do
        article = FactoryGirl.build(:article, published_at: Date.yesterday)
        article.publish

        expect(article.published_at).to eq Date.yesterday
      end
    end
  end
end
