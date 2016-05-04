class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.float :expenditure
      t.references :Item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
