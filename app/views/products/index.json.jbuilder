json.array!(@products) do |product|
  json.extract! product, :id, :name, :material, :type_wood, :processing, :size, :sort, :price, :unit, :img
  json.url product_url(product, format: :json)
end
