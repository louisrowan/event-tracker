get '/' do

  erb :index
end

post '/' do

  teams = params[:team].split(' ').join('-').downcase

  url = "https://api.seatgeek.com/2/events?performers.slug=#{teams}"
  response = HTTParty.get(url)
  body = JSON.parse(response.body)
  events = body["events"]

  @teams = []

  events.each do |event|
      hash = {
      title: event["title"],
      date: event["datetime_local"].to_s,
      stadium: event["venue"]["name"],
      location: event["venue"]["extended_address"],
      image: event["performers"][0]["images"]["huge"]
      }
    t = Team.create(hash)
    @teams << t
  end
  erb :index
end
