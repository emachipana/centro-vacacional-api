class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create

  def create
    user = User.valid_login?(params[:username], params[:password])
    if user
      user.regenerate_token
      render json: user
    else
      render_unauthorized("Incorrect email or password")
    end
  end

  def destroy
    current_user.invalid_token
    head :no_content
  end
end