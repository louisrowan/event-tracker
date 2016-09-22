get '/' do

  erb :index
end

post '/' do
  @events = []
  create_body(params[:event]).each do |event|
    t = Event.create(create_event_hash(event))
    @events << t
  end
  erb :index
end
