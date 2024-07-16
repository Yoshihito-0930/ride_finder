Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'staticpages#top'
  get 'contact', to: 'staticpages#contact'
  get 'privacy_policy', to: 'staticpages#privacy_policy'

  get 'terms_of_service', to: 'staticpages#terms_of_service'

  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'logout', to: 'sessions#destroy'
  
  # get 'search_results', to: 'search_results#index'
  get 'search', to: 'search#index'
  get 'search/results', to: 'search#search'
  
  # resouces :destinations, only: %i[show]
  resource :users, only: %i[show edit update]
  resources :safety_tips, only: %i[index]
  resources :destinations, only: %i[show]
end
