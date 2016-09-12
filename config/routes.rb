Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  namespace :admin do
    resources :products do
      member do
        post :publish
        post :hide
      end
    end

  end

  resources :users do
    member do
      post :admin
      post :user
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts
end
