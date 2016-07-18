class Post < ActiveRecord::Base
  belongs_to :user
  has_many :upvotes
  has_many :downvotes
  validates :text, length: { maximum: 140 }
  def votes
  	self.upvotes.count - self.downvotes.count
  end
end
