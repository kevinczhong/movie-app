# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Actor.create({ first_name: "Benedict", last_name: "Cumberbatch", known_for: "Sherlock" })
# Actor.create({ first_name: "Matt", last_name: "Damon", known_for: "Good Will Hunting" })
# Actor.create({ first_name: "Brad", last_name: "Pitt", known_for: "Moneyball" })

10.times do
  Actor.create({ first_name: "#{FFaker::Name.first_name}", last_name: "#{FFaker::Name.last_name}", known_for: "#{FFaker::Movie.title}" })
end

10.times do
  Movie.create({ title: "#{FFaker::Movie.title}", year: rand(1920..2022), plot: "plot goes here" })
end
