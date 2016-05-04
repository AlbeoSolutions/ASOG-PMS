class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :project, index: true
      t.string :item_title
      t.float :budget
      t.float :amount_spent, default: 0
      t.float :balance_left
      t.float :percentage_spent, default: 0
      

      t.timestamps null: false
    end
  end
end
