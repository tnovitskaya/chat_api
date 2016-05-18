class Chat < ActiveRecord::Base

  has_many   :conversations, dependent: :destroy
  has_many   :users, through: :conversations
  has_many   :messages

  validates :name, presence: true
  validates :users, length: { minimum: 2, message: "Please add one more participant to chat" }

  def as_json(options={})
    super(only: [:id,:name], include: { users: { only: :id } }, methods: :unread_messages_count)
  end

end
