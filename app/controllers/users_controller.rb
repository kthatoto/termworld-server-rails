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

  def show
    user = User.find_by!(account: @current_account, name: params[:name])
    return render json: { user: UserSerializer.new(user) }
  end

  def earn_exp
    user = User.find_by!(account: @current_account, name: params[:name])
    user.exp += params[:exp].to_i

    diff = false
    if user.can_levelup?
      diff = user.levelup!
    else
      user.save!
    end
    render json: { user: UserSerializer.new(user), leveluped: !!diff, diff: diff || {} }
  end
end
