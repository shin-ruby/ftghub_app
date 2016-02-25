# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  'Shin Zhang',
             email: 'shin@gmail.com',
             password:              '12345678',
             password_confirmation: '12345678',
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  User.create!(name:  name,
               email: email,
               password:              'password',
               password_confirmation: 'password')
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  tag = ['Aikido', 'Karate', 'Taekwondo', 'Thai boxing', 'Boxing', 'Tai Chi', 'Sanda', 'Kendo', 
          'Wing Chun', 'Judo', '八极拳'].sample
  users.each { |user| user.fightposts.create!(content: content, tag_list: tag) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
