json.extract! order, :id, :food_id, :client_id, :place, :state, :paid, :amount, :created_at, :updated_at
json.url order_url(order, format: :json)
