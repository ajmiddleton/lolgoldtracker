Rails.application.routes.draw do
  root to: 'summoners#index'

  resources :summoners, only: [:index, :create, :show]
end
