class UsersController < ApplicationController
  before_action :authenticate!

  def index
    render json: { action: :index }
  end

  def create
    render json: { action: :create }
  end
end
