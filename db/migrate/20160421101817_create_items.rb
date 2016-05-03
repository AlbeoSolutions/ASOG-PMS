class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :project, index: true
      t.string :item_title
      t.decimal :budget
      t.decimal :amount_spent, default: 0
      t.decimal :balance_left
      t.decimal :percentage_spent, default: 0
      t.text :comments

      t.timestamps null: false
    end
  end
end
