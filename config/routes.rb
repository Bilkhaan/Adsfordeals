Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  root 'deals#index'

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

  resources :rewards, only: [:index, :show] do
    member do
      post :purchase
    end
  end

  resources :deals, only: [:index, :show]

  get '/transactions' => 'payments#index'
  get '/dashboard' => 'homes#dashboard'
end
