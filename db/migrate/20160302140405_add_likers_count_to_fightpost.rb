class AddLikersCountToFightpost < ActiveRecord::Migration[5.0]
  def change
    add_column :fightposts, :likers_count, :integer, default: 0
  end
end
