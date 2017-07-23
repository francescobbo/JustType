shared_examples_for 'a protected page' do
  let(:method) { :get }
  let(:params) { {} }

  context 'when the user is an admin' do
    before do
      controller.session[:user_id] = FactoryGirl.create(:user, :admin).id
    end

    after do
      controller.session[:user_id] = nil
    end

    it 'is successful' do
      send(method, action, params: params)
      expect(response.status).to be_in(200..399)
    end
  end

  context 'when the user is signed in but is not an admin' do
    before do
      controller.session[:user_id] = FactoryGirl.create(:user).id
    end

    after do
      controller.session[:user_id] = nil
    end

    it 'redirects to the home page' do
      send(method, action, params: params)
      expect(response).to redirect_to root_path
    end
  end

  context 'when no user is signed in' do
    it 'redirects to signin form' do
      send(method, action, params: params)
      expect(response).to redirect_to admin_signin_path
    end
  end
end
