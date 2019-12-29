Rails.application.routes.draw do
  root 'directories#index'

  resources :directories
end
