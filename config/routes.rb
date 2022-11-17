Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories do 
    resources :purchases 
  end

  root to: 'home#index'
end
