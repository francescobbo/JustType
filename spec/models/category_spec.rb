require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to have_many :articles }

  it 'has tree relationships' do
    c1 = FactoryGirl.create(:category)
    c2 = FactoryGirl.create(:category, parent: c1)

    expect(c1.children).to eq [c2]
    expect(c2.parent).to eq c1
  end
end
