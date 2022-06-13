class OrdersController < ApplicationController
  before_action :authorize_user
  before_action :set_order, only: %i[ show update destroy ]

  # GET /orders or /orders.json
  def index
    if current_user.type_user == "normal"
      @orders = current_user.client.orders
    else
      @orders = Order.all
    end
    render json: @orders, status: :ok
  end

  # GET /orders/1 or /orders/1.json
  def show
    render json: @order, status: :ok
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

      if @order.save
        render @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
      if @order.update(order_params)
        render @order, status: :ok, location: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:food_id, :client_id, :place, :state, :paid, :amount)
    end

    def authorize_user
      return if current_user

      errors = { errors: { message: "Acces denied" } }
      render json: errors, status: :unauthorized
    end
end
