class Message < ActiveRecord::Base

  belongs_to :user
  belongs_to :chat

  # serialize :readed_by_users, Array

  validates :text, :user_id, :chat_id, presence: true

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

end
