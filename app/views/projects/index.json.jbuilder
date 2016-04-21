json.array!(@projects) do |project|
  json.extract! project, :id, :project_title, :project_acronym, :project_director, :funding_agency, :start_date, :end_date, :total_budget, :total_amount_spent, :account_number
  json.url project_url(project, format: :json)
end
