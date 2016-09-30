require_relative '../spec_helper'
require_relative '../../app/helpers/sessions'

describe "user model" do
  let (:user) {User.new(username: 'joe', password: 'pass', email: 'e')}

  it "has a name" do
    expect(user.username).to eq 'joe'
  end

  it 'has a password' do
    expect(user.password).to eq 'pass'
  end

end

describe "event model" do
let (:event) {Event.new(
  title: 'Justin Bieber Live',
  date: 'Jan 10, 1899',
  stadium: 'Madison Square Garden',
  location: 'NYC',
  image: 'www.google.com.jpeg',
  ticket_count: 1,
  lowest_price: '3.50',
  buy_url: 'www.seatgeek.com',
  list_id: nil
  )}

  it 'has a title' do
    expect(event.title).to eq 'Justin Bieber Live'
  end

  it 'has a ticket count' do
    expect(event.ticket_count).to eq 1
  end

  it 'can connect to a list' do
    expect(event.list_id).to eq nil
  end



end
