Rails.application.routes.draw do
  scope module: :accounts do
    post :token
    post :login
    post :logout
  end
  resources :users, only: [:index, :create, :show], param: :name do
    member do
      patch :earn_exp
    end
  end
end
