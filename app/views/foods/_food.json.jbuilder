json.extract! food, :id, :name, :price, :amount, :description, :primer, :type, :state, :created_at, :updated_at
json.url food_url(food, format: :json)
