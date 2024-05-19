Rails.application.routes.draw do
  get 'staticpages/top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'staticpages#top'
  # Defines the root path route ("/")
  # root "articles#index"
end
