json.array!(@queue_models) do |queue_model|
  json.extract! queue_model, :id, :name, :gps_lon, :gps_lat, :description, :image, :num_customer, :last_customer, :average_time
  json.url queue_model_url(queue_model, format: :json)
end
