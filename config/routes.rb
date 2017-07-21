Rails.application.routes.draw do
  namespace :admin do
    root to: 'admin#dashboard'

    get :signin, to: 'sessions#new'
    post :signin, to: 'sessions#create'
    delete :signout, to: 'sessions#destroy'
  end

  root to: 'pages#index'
end
