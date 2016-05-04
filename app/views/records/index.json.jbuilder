json.array!(@records) do |record|
  json.extract! record, :id, :expenditure, :Item_id
  json.url record_url(record, format: :json)
end
