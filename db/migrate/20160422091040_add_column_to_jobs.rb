class AddColumnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :project_id, :integer
    add_column :jobs, :staff_id, :integer
  end
end
