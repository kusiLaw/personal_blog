class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: %i[show]

  def index
    users = User.all.order(:id)
    render json: users
  end

  def show
    render json: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
