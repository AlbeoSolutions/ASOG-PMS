class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :project, index: true
      t.string :task_title
      t.text :description
      t.date :due_date
      t.date :date_accomplished, default: nil
      t.boolean :isFinished, default: false
      
      t.timestamps null: false
    end
  end
end
