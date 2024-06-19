Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'staticpages#top'
  get 'contact', to: 'staticpages#contact'

  get 'terms_of_service', to: 'staticpages#terms_of_service'

  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy'
  
  # get 'search_results', to: 'search_results#index'
  get 'search', to: 'search#index'
  get 'search/results', to: 'search#search'
  
  resource :users, only: %i[show edit update]
  # Defines the root path route ("/")
end
