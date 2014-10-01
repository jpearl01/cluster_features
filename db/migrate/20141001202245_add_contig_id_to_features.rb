class AddContigIdToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :contig_id, :integer
    add_index :features, :contig_id
  end
end
