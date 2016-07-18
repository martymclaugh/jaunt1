# 100.times do
# 	User.create(full_name: Faker::Name.name, username: Faker::App.name + rand(1..9999).to_s, email: Faker::Internet.email + rand(1..9999).to_s, password: Faker::Internet.password)
# end


# 100.times do
#   Follow.create(follower_id: rand(1..100), 
#         following_id: rand(1..100))
# end


# Users
User.create!(full_name:  "Example User",
             email: "example@railstutorial.org",
             username: "marty",
             password:              "foobar",)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  username = Faker::Name.name.delete(' ')
  User.create!(full_name: name,
              email: email,
              username: username,
              password:              password)
end

1000.times do
	Post.create(text: Faker::Lorem.sentence(4),
				user_id: rand(1..100))
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.posts.create!(text: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]

following.each { |followed| Follow.create(following_id: followed.id,
	follower_id: user.id) }
followers.each { |follower| Follow.create(following_id: user.id,
	follower_id: follower.id) }






