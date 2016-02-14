Rails.application.routes.draw do
  devise_for :users
  root 'homes#dashboard'
end
