class FoodsController < ApplicationController
  before_action :authorize_user
  before_action :set_food, only: %i[ show update destroy ]

  # GET /foods or /foods.json
  def index
    @foods = Food.all
    render json: @foods, status: :ok
  end

  # GET /foods/1 or /foods/1.json
  def show
    render json: @food, status: :ok
  end

  # POST /foods or /foods.json
  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food, status: :created
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    if @food.update(food_params)
      render @food, status: :ok
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_params
      params.require(:food).permit(:name, :price, :amount, :description, :primer, :type, :state, :banner)
    end

    def authorize_user
      return if currrent_user

      errors = { errors: { message: "Acces denied" } }
      render json: errors, status: :unauthorized
    end
end
