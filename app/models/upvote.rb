class Upvote < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :posts, foreign_key: :post_id, class_name: "Post"
  belongs_to :users, foreign_key: :user_id, class_name: "User"
end
