json.extract! room, :id, :beds_number, :price, :state, :type, :num_room, :description, :created_at, :updated_at
json.url room_url(room, format: :json)
