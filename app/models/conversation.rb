class Conversation < ActiveRecord::Base

  belongs_to :user
  belongs_to :chat

  #validates :user_id, :chat_id, presence: true

end
