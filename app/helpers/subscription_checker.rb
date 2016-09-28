helpers do

  def subscription_invalid?(event)
    current_user.events.any? do |e|
      e.title == event.title
    end

  end







end
