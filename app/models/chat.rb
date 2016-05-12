class Chat < ActiveRecord::Base

  has_many   :user_and_chat_links, dependent: :destroy
  has_many   :users, through: :user_and_chat_links
  has_many   :messages

  validates :name, :user_id, presence: true

end
