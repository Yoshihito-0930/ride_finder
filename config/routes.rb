Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'staticpages#top'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'search_results', to: 'search_results#index'

  resource :users, only: %i[show edit update]
  # Defines the root path route ("/")
  # root "articles#index"
end
