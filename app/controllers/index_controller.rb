get '/' do
  erb :index
end

post '/' do
  @list = List.create
  create_body(params[:event]).each_with_index do |event, i|
    t = Event.create(create_event_hash(event, i, params[:event]))
    @list.events << t
  end
  if request.xhr?
    erb :'/partials/_events', layout: false, locals: { list: @list}
  else
    puts "*"*100
    erb :index
  end
end
