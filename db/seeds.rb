# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

1.times do
  user = User.new(
    email:    'phitchcock@me.com',
    password: 'helloworld'
  )
  user.skip_confirmation!
  user.save
end
users = User.all

5.times do 
  Topic.create(
    name: Faker::Internet.domain_word,
    description: Faker::Lorem.sentence
  )
end
topics = Topic.all

50.times do 
  Bookmark.create(
    user: users.sample,
    topic: topics.sample,
    name: Faker::Internet.domain_word,
    url: Faker::Internet.domain_name
    )
end


puts "Seed finished"
puts "#{Topic.count} posts created"
puts "#{Bookmark.count} comments created"