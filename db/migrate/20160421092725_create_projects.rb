class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.string :project_acronym
      t.string :project_director
      t.string :funding_agency
      t.date :start_date
      t.date :end_date, default: nil
      t.float :total_budget
      t.float :total_amount_spent, default: 0
      t.float :actual_expenditure_percentage, default: 0
      t.string :account_number
      t.boolean :isOngoing, default: true

      t.timestamps null: false
    end
  end
end
