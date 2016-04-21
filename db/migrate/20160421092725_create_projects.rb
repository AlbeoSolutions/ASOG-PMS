class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_acronym
      t.string :project_director
      t.string :funding_agency
      t.date :start_date
      t.date :end_date
      t.decimal :total_budget
      t.decimal :total_amount_spent
      t.string :account_number

      t.timestamps null: false
    end
  end
end
