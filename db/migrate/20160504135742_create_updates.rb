class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :content
      t.boolean :read
      t.datetime :expiry

      t.timestamps null: false
    end
  end
end
