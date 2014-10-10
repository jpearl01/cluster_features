class ChangeSequenceToText < ActiveRecord::Migration
  def self.up
  	change_column :contigs, :sequence, :text, :limit => 4294967295
  	change_column :features, :sequence, :text, :limit => 4294967295
  end

  def self.down
  	change_column :contigs, :sequence, :string
  	change_column :features, :sequence, :string
  end
end
