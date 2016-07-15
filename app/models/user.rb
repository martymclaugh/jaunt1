class User < ActiveRecord::Base


  include BCrypt

  has_many :posts
  has_many :follows, foreign_key: :follower_id, class_name: Follow
  has_many :follows, foreign_key: :following_id, class_name: Follow
  has_many :follower, through: :follows, source: :following
  has_many :following, through: :follows, source: :follower

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
