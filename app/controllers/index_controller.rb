get '/' do

  erb :index
end

post '/' do
  @list = List.create
  create_body(params[:event]).each do |event|
    t = Event.create(create_event_hash(event))
    @list.events << t
  end
  p @list
  if request.xhr?
    erb :'/partials/_events', layout: false, locals: { list: @list}
  else
    erb :index
  end
end
