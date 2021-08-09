Rails.application.routes.draw do
  root "categories#index"

  resources :categories do
    resources :todos
  end

  devise_for :users
end
