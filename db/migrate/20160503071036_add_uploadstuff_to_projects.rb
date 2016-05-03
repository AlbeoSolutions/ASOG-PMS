class AddUploadstuffToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :project_summary_filename, :string
    add_column :projects, :project_brief_filename, :string
  end
end
