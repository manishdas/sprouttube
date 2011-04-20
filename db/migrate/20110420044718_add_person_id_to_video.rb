class AddPersonIdToVideo < ActiveRecord::Migration
  def self.up
    add_column :videos, :person_id, :integer
  end

  def self.down
    remove_column :videos, :person_id
  end
end
