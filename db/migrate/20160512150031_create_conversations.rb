class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :recipient
      t.belongs_to :message

      t.timestamps
    end
  end
end
