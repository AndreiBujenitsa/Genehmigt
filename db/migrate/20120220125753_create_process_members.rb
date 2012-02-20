class CreateProcessMembers < ActiveRecord::Migration
  def change
    create_table :process_members do |t|
      t.string :email
      t.integer :role_id
      t.integer :process_id

      t.timestamps
    end
  end
  def self.down
    drop_table :process_members
  end
end
