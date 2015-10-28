Rails.application.routes.draw do
  resources :schools, only: [:index, :show, :new, :create]
  resources :counties, only: [:index, :show]
end
