json.array!(@products) do |product|
  json.extract! product, :id, :name, :material, :size, :sort, :price, :unit, :img
  json.url product_url(product, format: :json)
end
