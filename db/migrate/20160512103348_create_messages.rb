class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :sender
      t.belongs_to :chat
      t.integer :readed_by_users, default: 0.0

      t.timestamps null: false
    end

  end
end
