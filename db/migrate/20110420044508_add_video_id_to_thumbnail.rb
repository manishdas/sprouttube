class AddVideoIdToThumbnail < ActiveRecord::Migration
  def self.up
    add_column :thumbnails, :video_id, :integer
  end

  def self.down
    remove_column :thumbnails, :video_id
  end
end
