Rails.application.routes.draw do
  get 'users/show'
  get 'staticpages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'staticpages#top'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  # Defines the root path route ("/")
  # root "articles#index"
end
