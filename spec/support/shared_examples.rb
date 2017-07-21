shared_examples_for 'a protected page' do
  context 'when the user is an admin' do
    before do
      controller.session[:user_id] = FactoryGirl.create(:user, :admin).id
    end

    it 'is successful' do
      get action
      expect(response).to be_successful
    end
  end

  context 'when the user is signed in but is not an admin' do
    before do
      controller.session[:user_id] = FactoryGirl.create(:user).id
    end

    it 'redirects to the home page' do
      get action
      expect(response).to redirect_to root_path
    end
  end

  context 'when no user is signed in' do
    it 'redirects to signin form' do
      get action
      expect(response).to redirect_to admin_signin_path
    end
  end
end
