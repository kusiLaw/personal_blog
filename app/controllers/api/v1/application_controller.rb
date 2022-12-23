class Api::V1::ApplicationController < ActionController::API
  before_action :confirm_access
  respond_to :json

  private

  def confirm_access
    has_access = User.find_by_api_token(params[:api_token])
    head :unauthorized unless has_access
  end
end
