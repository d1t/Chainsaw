json.array!(@stores) do |store|
  json.extract! store, :id, :product_id, :product_quantity, :price, :image_url
  json.url store_url(store, format: :json)
end
