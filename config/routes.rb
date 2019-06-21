Rails.application.routes.draw do
  scope module: :accounts do
    post :token
    post :login
    post :logout
  end
  resources :users, only: [:index, :create]
end
