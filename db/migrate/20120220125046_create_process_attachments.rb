class CreateProcessAttachments < ActiveRecord::Migration
  def change
    create_table :process_attachments do |t|
      t.integer :process_id
      t.string :attachment
      t.timestamps
    end
  end
  
  def self.down
    drop_table :process_attachments
  end
end
