Rails.application.routes.draw do
  namespace :admin do
    root to: 'admin#dashboard'

    get :signin, to: 'sessions#new'
    post :signin, to: 'sessions#create'
    delete :signout, to: 'sessions#destroy'

    resources :articles
  end

  root to: 'pages#index'

  get '/manifest.json', to: 'meta#manifest', as: :application_manifest, defaults: { format: :json }
  get '/robots.txt', to: 'meta#robots', as: :robots, defaults: { format: :txt }
  get '/feed.rss', to: 'meta#feed', as: :feed, defaults: { format: :rss }
  get '/sitemaps/index.xml', to: 'meta#sitemap_index', as: :sitemap_index, format: :xml
  get '/sitemaps/:type.xml', to: 'meta#sitemap', as: :sitemap, defaults: { format: :xml }

  get '/*slug', to: 'articles#show', as: :article
end
