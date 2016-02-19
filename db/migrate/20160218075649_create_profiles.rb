class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :fullname
      t.date :birthday
      t.string :sex
      t.string :tel
      t.text :introduction
      t.string :avatar
    end
  end
end
