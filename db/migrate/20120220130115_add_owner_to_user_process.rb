class AddOwnerToUserProcess < ActiveRecord::Migration
  def self.up
    add_column :user_processes, :owner, :string
  end

  def self.down
    remove_column :user_processes, :owner
  end
end
