class CreateUserProcesses < ActiveRecord::Migration
  def change
    create_table :user_processes do |t|
      t.string :title
      t.text :message
      t.integer :user_id
      t.integer :parent_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :user_processes
  end
end
