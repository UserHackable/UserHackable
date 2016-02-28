class AddImageToProduct < ActiveRecord::Migration
  def change
    change_table "products" do |t|
      t.string   "image_name"
      t.string   "image_content_type"
      t.string   "image_id"
      # t.string   "image_url"
      t.string   "image_file_size"
      t.string   "image_file_name"
      t.datetime "image_updated_at"
      t.boolean  "image_processing"
      t.string   "image_path"
    end
  end
end
