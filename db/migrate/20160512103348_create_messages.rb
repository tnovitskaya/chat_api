class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :readed_by_users, default: 0.0
      t.integer :chat_id

      t.timestamps null: false
    end

  end
end
