class FixTypeName < ActiveRecord::Migration
  def self.up
  	rename_column :features, :type, :f_type
  end
  def self.down
  	rename_column :features, :f_type, :type
  end
end
