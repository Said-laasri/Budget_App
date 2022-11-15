Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories 

  resources :purchases

  root to: 'users#index'
end
