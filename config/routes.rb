Rails.application.routes.draw do
  root 'static_pages#index'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:show] do
  end
  resources :seats, only: [:new, :create, :destroy] do
  end
end
