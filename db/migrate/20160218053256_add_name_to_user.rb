class AddNameToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :image_url
    end
  end
end
