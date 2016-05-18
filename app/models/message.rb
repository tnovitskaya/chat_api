class Message < ActiveRecord::Base

  acts_as_readable on: :created_at

  belongs_to :user
  belongs_to :chat

  validates :text, :user_id, :chat_id, presence: true

  def as_json(options={})
    super(only: [:id,:text], methods: :created_time, 
            include: { user: { only: :username } })
  end

  def created_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

end
