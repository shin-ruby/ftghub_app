class AddCommentsCountToFightpost < ActiveRecord::Migration
  def change
    add_column :fightposts, :comments_count, :integer, default: 0
  end
end
