Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  get 'charges/downgrade' => 'charges#downgrade'
  resources :wikis
  resources :collaborators, only: [:create, :destroy]
  devise_for :users
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
