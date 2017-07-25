Rails.application.routes.draw do
  namespace :admin do
    root to: 'admin#dashboard'

    get :signin, to: 'sessions#new'
    post :signin, to: 'sessions#create'
    delete :signout, to: 'sessions#destroy'

    resources :posts
  end

  root to: 'pages#index'

  get '/*slug', to: 'posts#show', as: :post
end
