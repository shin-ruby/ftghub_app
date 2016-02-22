class Liker < ActiveRecord::Base
	belongs_to :user
	belongs_to :fightpost
	validates :user_id, presence: true
	validates :fightpost_id, presence: true
end
