class AddYoutubeUrlToProject < ActiveRecord::Migration
  def change
    add_column :projects, :youtube_id, :string
  end
end
