class AddComplimentToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :strand, :integer
  end
end
