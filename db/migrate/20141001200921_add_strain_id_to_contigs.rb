class AddStrainIdToContigs < ActiveRecord::Migration
  def change
    add_column :contigs, :strain_id, :integer
    add_index :contigs, :strain_id
  end
end
