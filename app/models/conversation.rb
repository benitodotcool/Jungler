class Conversation < ApplicationRecord


  belongs_to :participant_a, class_name: 'User'
  belongs_to :participant_b, class_name: 'User'


  validates :participant_a, presence: true
  validates :participant_b, presence: true
   
  has_many :messages 
  
  after_create :conversation_send_to_a
  after_create :conversation_send_to_b

  def conversation_send_to_a

    @user_id_a = Conversation.find(self.id).participant_a_id
    @user_a = User.find(@user_id_a)
    UserMailer.conversation_email_to_a(@user_a).deliver_now
  end

  def conversation_send_to_b

    @user_id_b = Conversation.find(self.id).participant_b_id
    @user_b = User.find(@user_id_b)
    UserMailer.conversation_email_to_b(@user_b).deliver_now
  end

end
