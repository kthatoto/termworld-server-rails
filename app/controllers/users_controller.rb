class UsersController < ApplicationController
  before_action :authenticate!

  def index
    users = User.where(account_id: @current_account.id)
    render json: { users: users.map { |u| UserSerializer.new(u) } }
  end

  def create
    if User.find_by(account: @current_account, name: params[:name])
      return render json: { message: "'#{params[:name]}' is already used" }, status: 409
    end
    user = User.create!(account: @current_account, name: params[:name])
    render json: { user: UserSerializer.new(user) }, status: 201
  end
end
