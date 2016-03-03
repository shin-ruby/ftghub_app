class Liker < ApplicationRecord
  belongs_to :user
  belongs_to :fightpost, counter_cache: true
end
