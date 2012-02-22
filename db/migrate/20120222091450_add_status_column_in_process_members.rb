class AddStatusColumnInProcessMembers < ActiveRecord::Migration
  def up
    add_column :process_members, :state, :string
  end

  def down
    remove_column :process_members, :state
  end
end
