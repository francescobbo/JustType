require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it { is_expected.to belong_to :author }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :rendered_content }

  context 'on creation' do
    context 'when a slug is specified' do
      it 'maintains the given slug' do
        post = FactoryGirl.create(:post, slug: 'i-am-a-slug')
        expect(post.slug).to eq 'i-am-a-slug'
      end
    end

    context 'when the slug is left empty' do
      it 'generates a slug' do
        post = FactoryGirl.create(:post, title: 'I am a title')
        expect(post.slug).to eq 'i-am-a-title'
      end
    end
  end

  describe '#publish' do
    context 'when the published_at timestamp is nil' do
      it 'sets the published_at timestamp' do
        post = FactoryGirl.build(:post, published_at: nil)
        post.publish

        expect(post.published_at).to be_within(1.second).of Time.now
      end
    end

    context 'when the published_at timestamp is set' do
      it 'does not replace it' do
        post = FactoryGirl.build(:post, published_at: Date.yesterday)
        post.publish

        expect(post.published_at).to eq Date.yesterday
      end
    end
  end
end
