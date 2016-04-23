class AddKpaClusterRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :kpa_cluster, index: true, foreign_key: true
  end
end
