class Conversation < ActiveRecord::Base
  belongs_to :user
  belongs_to :message
  belongs_to :recipient,
               :class_name => 'User',
               :primary_key => 'user_id',
               :foreign_key => 'recipient_id'
end
