class CreateKpaClusters < ActiveRecord::Migration
  def change
    create_table :kpa_clusters do |t|
      t.string :kpa_title

      t.timestamps null: false
    end
  end
end
