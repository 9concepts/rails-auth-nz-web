class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    authorize @user
  rescue Pundit::NotAuthorizedError
    head :forbidden
  end
end
