Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'homes#dashboard'

  resources :content_items, only: [:show] do
    member do
      post :completed_ad
    end
  end

  resources :users, only: [] do
    collection do
      get :analytics
    end
  end

  resources :rewards, only: [:index, :show]

  get '/transactions' => 'payments#index'
end
