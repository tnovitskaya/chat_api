class Message < ActiveRecord::Base

  belongs_to :sender, class_name: 'User'
  belongs_to :chat
  has_many   :conversations, dependent: :destroy
  has_many   :recipients, through: :conversations, class_name: 'User'

  validates :text, :sender_id, :chat_id, presence: true

end
