helpers do


  def create_body(json)
    event = json.split(' ').join('-').downcase
    url = "https://api.seatgeek.com/2/events?performers.slug=#{event}"
    response = HTTParty.get(url)
    body = JSON.parse(response.body)
    events = body["events"]
  end



  def create_event_hash(event, i, params)
    hash = {
      title: event["title"],
      date: Date.parse(event["datetime_local"]).to_s,
      stadium: event["venue"]["name"],
      location: event["venue"]["extended_address"],
      image: add_giphy(params, i),
      ticket_count: event["stats"]["listing_count"].to_i || 0,
      lowest_price: event["stats"]["lowest_price"].to_i || 'N/A',
      buy_url: event["url"]
      }
      return hash
  end

  def add_giphy(event, index)
    event = event.split('-')
    event = event.join('+')
    response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{event}&api_key=dc6zaTOxFJmzC")
    return response["data"][index]["images"]["fixed_height"]["url"]
  end

end
