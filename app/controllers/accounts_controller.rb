class AccountsController < ApplicationController

  def token
    account = Account.find_or_create_by(email: params[:email])
    account.update!(token: SecureRandom.urlsafe_base64(12))
  end

  def login
  end

  def logout
  end
end
