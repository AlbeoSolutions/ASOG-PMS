json.array!(@items) do |item|
  json.extract! item, :id, :item_title, :budget, :amount_spent, :balance_left, :percentage_spent, :comments
  json.url item_url(item, format: :json)
end
