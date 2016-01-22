class AddProIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pro_id, :string
    add_index :products, :pro_id
  end
end
