class CreateUserAndChatLinks < ActiveRecord::Migration
  def change
    create_table :user_and_chat_links do |t|
      t.belongs_to :user
      t.belongs_to :chat

      t.timestamps
    end
  end
end
