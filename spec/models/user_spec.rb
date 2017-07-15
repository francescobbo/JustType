require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it { is_expected.to have_many :posts }

  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
end
