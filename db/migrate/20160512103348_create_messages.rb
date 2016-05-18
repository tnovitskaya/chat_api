class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :user
      t.belongs_to :chat

      t.timestamps null: false
    end

  end
end
