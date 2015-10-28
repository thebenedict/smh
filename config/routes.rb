Rails.application.routes.draw do

  devise_for :users

  resources :employees, except: :destroy
  resources :employments, except: :destroy
end
