class Adddeliverabletotask < ActiveRecord::Migration
  def change
  	add_column :tasks, :submission, :string
  end
end
