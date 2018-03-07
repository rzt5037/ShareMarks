# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do
  User.create!(
    email:    Faker::Internet.unique.email,
    password: Faker::Internet.password(8)
  )
end
users = User.all


5.times do
  Topic.create!(
    user:   users.sample,
    title:  Faker::Science.element
  )
end
topics = Topic.all

15.times do
  Bookmark.create!(
    topic:  topics.sample,
    user:   users.sample,
    url:    Faker::Internet.url
  )
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} bookmarks created"
