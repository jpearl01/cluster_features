class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :length
      t.string :sequence
      t.integer :start
      t.integer :end
      t.string :annotation

      t.timestamps
    end
  end
end
