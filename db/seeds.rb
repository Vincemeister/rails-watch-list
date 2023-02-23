require "open-uri"
require "json"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

url = "https://tmdb.lewagon.com/movie/top_rated"

movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)

puts "Cleaning database..."
Movie.destroy_all
List.destroy_all
puts "Seeding database..."
movies["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}",
    rating: movie["vote_average"].to_f
  )
  puts "Created #{movie["title"]}"
end
List.create(name: "Anime")
List.create(name: "High-Quality")
List.create(name: "Avant-Garde-de-le-Baguette")
List.create(name: "Deutsch")
List.create(name: "Anti-Superhero")




puts "created #{movies.count} movies"
puts "created #{List.count} lists"


puts
