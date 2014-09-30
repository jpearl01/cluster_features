class CreateContigs < ActiveRecord::Migration
  def change
    create_table :contigs do |t|
      t.string :name
      t.integer :length
      t.string :sequence

      t.timestamps
    end
  end
end
