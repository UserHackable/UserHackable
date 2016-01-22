class ChangeProjectsId < ActiveRecord::Migration
  def change
    add_column :projects, :pro_id, :string
    add_index :projects, :pro_id
  end
end
