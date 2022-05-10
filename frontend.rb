require "http"

puts "Type all to return all database entries, and the specific ID number if you wish to return a specific entry."
pref = gets.chomp
if pref == "all"
  response = HTTP.get("http://localhost:3000/movies")
  index = response.parse(:json)
  pp index
else
  pref = pref.to_i
  response = HTTP.get("http://localhost:3000/movies/#{pref}")
  entry = response.parse(:json)
  pp entry
end
