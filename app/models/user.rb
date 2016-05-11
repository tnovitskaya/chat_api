class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  validates_uniqueness_of   :username, :case_sensitive => false, :allow_blank => true, :if => :username_changed?
  validates_presence_of     :username, :password, :on=>:create
  validates_confirmation_of :password, :on=>:create
  validates_length_of       :password, :within => Devise.password_length, :allow_blank => true
end
