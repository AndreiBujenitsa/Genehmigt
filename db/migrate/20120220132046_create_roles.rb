class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role
      t.timestamps
    end
  end
  def self.down
    drop_table :roles
  end
end
