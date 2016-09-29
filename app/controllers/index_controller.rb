get '/' do
  erb :index
end

post '/' do
  @list = List.create
  create_body(params[:event]).each do |event|
    t = Event.create(create_event_hash(event))
    @list.events << t
  end
  if @list.events.count > 0
    if request.xhr?
      erb :'/partials/_events', layout: false, locals: { list: @list}
    else
      puts "*"*100
      erb :index
    end
  else
    @errors = ['No results Found'].to_json
    if request.xhr?
      status 402
      @errors = 'No results Found'
    else
      erb :index
    end
  end
end
