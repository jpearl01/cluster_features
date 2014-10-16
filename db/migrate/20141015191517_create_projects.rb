class CreateProjects < ActiveRecord::Migration
  def change
  	drop_table :projects if table_exists? :projects
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.integer :num_strains
      t.string :comment

      t.timestamps
    end

    add_column :strains, :project_id, :integer
    add_index :strains, :project_id

    add_index :projects, :user_id
  end
end
