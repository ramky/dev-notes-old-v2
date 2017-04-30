Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'

  root to: 'topics#index'

  #resources :topics do
  #  resources :notes
  #end
  resources :topics, only: [:index]
end
