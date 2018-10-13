Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :update, :show] do
    collection do
       get :search
    end
    resources :lessons, only: [:index] do
      resources :user_owned_lessons, only:[:new, :create, :update]
    end
    resources :exams, only: [:index] do
      resources :user_owned_exams, only:[:new, :create, :update]
    end
  end
  resources :places,   only: [:index, :create, :edit, :update, :destroy]
  resources :lessons,  only: [:index,:show]
  resources :exams,    only: [:index]

  # calendars_controller
  get 'calendar/:current_date/:next_or_ago/', to: 'calendars#index', as: 'calendar'
  resources :daydetails, only: [:create, :update]

end
