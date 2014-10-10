class AddTypeToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :type, :string
  end
end
