Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'static_pages#top'
  get 'contact', to: 'static_pages#contact'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  get 'terms_of_service', to: 'static_pages#terms_of_service'

  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  get 'logout', to: 'sessions#destroy'
  
  # get 'search_results', to: 'search_results#index'
  get 'searchs/result', to: 'searchs#result'
  
  # resouces :destinations, only: %i[show]
  resource :users, only: %i[show edit update]
  resources :safety_tips, only: %i[index]
  resources :destinations, only: %i[create show] do
    collection do
      get :favorites
    end
  end
  resources :favorite_destinations, only: %i[create destroy]
  resources :future_visits, only: %i[create destroy]
end
