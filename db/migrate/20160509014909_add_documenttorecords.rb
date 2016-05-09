class AddDocumenttorecords < ActiveRecord::Migration
  def change
  	add_column :records, :document, :string
  end
end
