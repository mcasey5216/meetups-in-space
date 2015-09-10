# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.create!(name: "Space exploration!", description: "See name...", location:"Moon")
Meetup.create!(name: "Cross Pluto Skiing", description: "Also see name...", location:"Pluto")

# 100.times do
#    User.create(
#    provider: Faker::Company.name,
#    uid: Faker::Internet.password,
#    email: Faker::Internet.email,
#    username: Faker::Internet.user_name,
#    avatar_url: Faker::Avatar.image
#  )
# end
