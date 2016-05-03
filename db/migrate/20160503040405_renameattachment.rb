class Renameattachment < ActiveRecord::Migration
  def change
  	rename_column :projects, :attachment, :summary_filename
  	add_column :projects, :brief_filename, :string
  end
end
