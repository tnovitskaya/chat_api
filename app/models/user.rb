class User < ActiveRecord::Base
  acts_as_reader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  before_create :generate_authentication_token!

  validates :username, uniqueness: true
  validates :username, presence: true, on: [:create, :update]
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :password, length: { within: Devise.password_length,
                                   allow_blank: true}

  validates :auth_token, uniqueness: true

  has_many :messages
  has_many :chats, through: :conversations
  has_many :conversations, dependent: :destroy

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def as_json(options={})
    super(only: [:id,:username], methods: :messages_count)
  end

  def messages_count
    Message.where(user_id: id).count
  end
end
