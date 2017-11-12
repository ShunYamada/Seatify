Rails.application.routes.draw do
  get 'static_pages/index'

  root 'application#hello'
end
