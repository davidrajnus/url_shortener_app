Rails.application.routes.draw do
  # get 'urls/index'

  # get 'urls/create'

  root 'urls#index'
  resources :urls, only: [:index, :new, :create, :show]
end
