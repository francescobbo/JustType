require 'rails_helper'

describe Admin::AdminController do
  describe '#dashboard' do
    it_behaves_like 'a protected page' do
      let(:action) { :dashboard }
    end
  end
end
