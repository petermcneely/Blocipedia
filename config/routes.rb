Rails.application.routes.draw do
  resources :charges, only: [:new, :create]
  get 'charges/downgrade' => 'charges#downgrade'
  resources :wikis
  devise_for :users
  get 'about' => 'welcome#about'
  root 'welcome#index'
end
