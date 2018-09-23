Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :update, :show] do
    collection do
       get :search
    end
  end
  resources :places, only: [:index, :create, :edit, :update, :destroy]
end
