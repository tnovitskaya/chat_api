class Message < ActiveRecord::Base

  belongs_to :sender, class_name: 'User'
  belongs_to :chat
  has_many   :conversations, dependent: :destroy
  has_many   :recipient, class_name: 'User', through: :conversations

  validates :text, :sender_id, :recipient_id, :chat_id, presence: true

end
