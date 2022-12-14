Rails.application.routes.draw do
  devise_for :users
  root 'site#index'

  resources :posts, only: %i[new create] do
    resources :comments, only: %i[new create]
  end

  resources :likes, only: :create do
    delete :destroy, on: :collection
  end
end
