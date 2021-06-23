class UserGameStat < ApplicationRecord

belongs_to :user, dependent: :destroy

validates :level, presence: true, numericality: { greater_than: 0, less_than: 3100 }, on: :update
validates :summoner_id,length: {maximum: 63}, on: :update
#if :level != nil
#  validates :summoner_id,length: {maximum: 63}, on: :update
#  validates :primary_role, presence: true, on: :update
#  validates :secondary_role, presence: true, on: :update
#  validates :description, presence: true, length: {minimum: 30, maximum: 280}, on: :update
#end
  
end
