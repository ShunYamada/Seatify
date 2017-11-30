Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'static_pages#index'
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:show] do
    member do
      resources :reviews
    end
  end
  resources :seats
end
