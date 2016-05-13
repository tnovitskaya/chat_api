class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  before_create :generate_authentication_token!

  validates_uniqueness_of   :username, :case_sensitive => false, :allow_blank => true
  validates_presence_of     :username, on: [:create, :update]
  validates_presence_of     :password, on: :create
  validates_confirmation_of :password, :on=>:create
  validates_length_of       :password, :within => Devise.password_length, :allow_blank => true

  validates :auth_token, uniqueness: true

  has_many :messages, foreign_key: :sender_id
  has_many :user_and_chat_links, dependent: :destroy
  has_many :chats, through: :user_and_chat_links
  has_many :conversation, dependent: :destroy

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
