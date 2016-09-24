class User < ActiveRecord::Base
  include BCrypt
  has_and_belongs_to_many :events

  validates :password_hash, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params = {})
    @user = User.find_by(username: params[:username])
    return nil if not @user
    if @user.password == params[:password]
      return @user
    end
    return nil
  end

end
