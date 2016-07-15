100.times do |x|
	User.create(full_name: Faker::Name.name,
				username: Faker::App.name + rand(1..9999).to_s,
				email: Faker::Internet.email + rand(1..9999).to_s,
				password: Faker::Internet.password)
end

1000.times do |x|
	Post.create(text: Faker::Lorem.sentence(4),
				user_id: rand(1..100))
end

100.times do |x|
	Follow.create(follower_id: rand(1..100),
				followee_id: rand(1..100))
end