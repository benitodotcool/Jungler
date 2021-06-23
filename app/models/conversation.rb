class Conversation < ApplicationRecord


  belongs_to :participant_a, class_name: 'User'
  belongs_to :participant_b, class_name: 'User'

  # validates_uniqueness_of :participant_a, scope: [:participant_a, :participant_b]

  validates :participant_a, presence: true
  validates :participant_b, presence: true
   
  has_many :messages 
  
  after_create :conversation_send

  def conversation_send
    
    @user_id_a = Conversation.find(params[:id]).participant_a_id
    @user_a = User.find(@user_id_a)
    UserMailer.conversation_email(@user_a).deliver_now
  end

end
