Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts, only: [:show, :new, :create, :edit]

  root to: 'accounts#show'
end
