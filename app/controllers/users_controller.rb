class UsersController < ApplicationController
  before_action :authorize_user, except: %i[create]
  before_action :set_user, only: %i[ show update destroy ]
  skip_before_action :require_login, only: [:create]

  # GET /users/1 or /users/1.json
  def show
    render json: @user, status: :ok
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      render @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password_digest, :token, :client_id)
    end

    def authorize_user
      user = User.find(params[:id])
      return if current_user == user

      errors = { errors: { message: "Access denied" } }
      render json: errors, status: :unauthorized
    end
end
