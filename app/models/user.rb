class User < ActiveRecord::Base


  include BCrypt

  has_many :posts
  has_many :follows, foreign_key: "follower_id"
  has_many :follows, foreign_key: "followee_id"
  has_many :followers, through: :follows, source: :follower
  has_many :followees, through: :follows, source: :followee

  validates :full_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
