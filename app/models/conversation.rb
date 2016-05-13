class Conversation < ActiveRecord::Base

  belongs_to :message
  belongs_to :recipient, class_name: 'User'

  validates :recipient_id, :message_id, presence: true

end
