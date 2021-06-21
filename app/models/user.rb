class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validations 
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :summoner_name, uniqueness: true, presence: true, on: :update
  
  has_many :request_as_requestor, foreign_key: 'requestor_id', class_name: 'Match'
  has_many :receivers, through: :request_as_requestor

  has_many :request_as_receiver, foreign_key: 'receiver_id', class_name: 'Match'
  has_many :requestors, through: :request_as_receiver


  has_many :conversations_as_participant_a, foreign_key: 'participant_a', class_name: 'Conversation'
  has_many :conversations_as_participant_b, foreign_key: 'participant_b', class_name: 'Conversation'

  has_many :messages, through: :conversations
  
  after_create :welcome_send

  belongs_to :user_game_stat, optional: true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  
end
