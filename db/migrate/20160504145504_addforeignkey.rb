class Addforeignkey < ActiveRecord::Migration
  def change
  	add_reference :updates, :project, index: true 
  end
end
