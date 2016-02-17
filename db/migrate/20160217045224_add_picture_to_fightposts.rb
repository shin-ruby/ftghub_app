class AddPictureToFightposts < ActiveRecord::Migration
  def change
    add_column :fightposts, :picture, :string
  end
end
