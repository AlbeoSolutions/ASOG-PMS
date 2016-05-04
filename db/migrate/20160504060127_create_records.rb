class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.float :expenditure
      t.text :comments
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
