class RemoveLikesFromVideo < ActiveRecord::Migration
  def self.up
  remove_column :videos,:likes
  remove_column :videos,:tags
  end

  def self.down
        add_column :videos, :likes, :integer
        add_column :videos,:tags,:string
  end
end

