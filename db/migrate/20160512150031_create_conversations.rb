class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :recipient_id
      t.integer :message_id

      t.timestamps null: false
    end
  end
end
