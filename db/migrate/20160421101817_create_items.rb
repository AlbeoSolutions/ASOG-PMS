class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item_title
      t.decimal :budget
      t.decimal :amount_spent
      t.decimal :balance_left
      t.decimal :percentage_spent
      t.text :comments

      t.timestamps null: false
    end
  end
end
