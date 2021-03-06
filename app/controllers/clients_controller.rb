class ClientsController < ApplicationController
  before_action :authorize_user, except: %i[create]
  before_action :set_client, only: %i[ update destroy ]
  skip_before_action :require_login, only: [:create]

  def num_clients
    num = Client.all.size
    num_clients = { num: num }

    render json: num_clients, status: :ok
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    if @client.save
      render @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    if @client.update(client_params)
      render @client, status: :ok
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:first_name, :last_name, :email, :phone_number, :DNI, :expenses, :room_id)
    end

    def authorize_user
      client = Client.find(params[:id]);
      return if (current_user == client.user) || (current_user.type_user == "admin")
      
      errors = { errors: { message: "Acces denied" } }
      render json: errors, status: :unauthorized 
    end
end
