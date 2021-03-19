Rails.application.routes.draw do
  resources :deliveries, only: :create
end
