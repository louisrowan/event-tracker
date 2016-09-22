require 'httparty'
require 'awesome_print'

response = HTTParty.get('https://api.seatgeek.com/2/events?performers.slug=boston-red-sox')

 # ap response
x = response["events"][0]
puts x

# games = response["events"]

# games.each do |event|
# puts "title = #{event["title"]}"
# puts "date = #{event["datetime_local"]}"
# puts "stadium = #{event["venue"]["name"]}"
# puts "locaiton = #{event["venue"]["extended_address"]}"
# puts "image = #{event["performers"][0]["images"]["huge"]}"
# puts
# end
