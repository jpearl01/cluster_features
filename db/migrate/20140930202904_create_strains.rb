class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.integer :length
      t.integer :contig_num
      t.string :genus
      t.string :species

      t.timestamps
    end
  end
end
