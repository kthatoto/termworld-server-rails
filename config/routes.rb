Rails.application.routes.draw do
  scope module: :accounts do
    get "token/:email", action: :token
    post :login
    post :logout
  end
end
