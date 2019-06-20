class AccountsController < ApplicationController

  def token
    account = Account.find_or_create_by(email: params[:email])
    account.update!(token: SecureRandom.urlsafe_base64(16))
    TokenMailer.send_token(account).deliver_now
    render json: {}
  end

  def login
    account = Account.find_by(email: params[:email], token: params[:token])
    return render json: {}, status: 404 if account.nil?
    render json: {}
  end

  def logout
    account = Account.find_by(email: params[:email], token: params[:token])
    return render json: {}, status: 404 if account.nil?
    account.update!(token: nil)
    render json: {}
  end
end
