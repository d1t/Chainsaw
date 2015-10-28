json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :quantity, :category, :subcategory, :image, :price
  json.url product_url(product, format: :json)
end
