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


3.times do 
  Bookmark.create(
    user: users.sample,
    name: Faker::Internet.domain_word,
    url: Faker::Internet.domain_name
    )
end


puts "Seed finished"
puts "created"
puts "#{Bookmark.count} comments created"