require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :rendered_content }
end
