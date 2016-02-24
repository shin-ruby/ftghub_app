class Comment < ActiveRecord::Base
  belongs_to :fightpost, counter_cache: true
  belongs_to :user
  scope :recent, -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :fightpost_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
