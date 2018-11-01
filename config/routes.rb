Rails.application.routes.draw do
  devise_for :users
  root to: 'calendars#index', current_date: Date.today, next_or_prev: 0
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
  resources :lessons,  only: [:index, :edit, :new, :create] do
    collection do
       get :search
    end
  end
  resources :exams,    only: [:index]

  # calendars_controller
  get 'calendar/:current_date/:next_or_prev/', to: 'calendars#index', as: 'calendar'
  post  'day_details/:current_date',    to: 'day_details#create', as: 'day_details'
  patch 'day_detail/:id/:current_date', to: 'day_details#update', as: 'day_detail'

end
