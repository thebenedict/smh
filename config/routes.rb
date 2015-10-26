Rails.application.routes.draw do

  devise_for :users

  resources :employees, except: :destroy
  resources :employments, only: [:index, :create]
end
