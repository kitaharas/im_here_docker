# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..6).each do |n|
  Feel.create!(
    feel_title: "feel#{n}"
  )
end

(1..6).each do |n|
  Genre.create!(
    genre_title: "genre#{n}"
  )
end

(1..50).each do |n|
  Event.create!(
    event_title: "event#{n}",
    genre_id: (n % 6) + 1,
    feel_id: (n % 6) + 1
  )
end



