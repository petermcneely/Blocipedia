# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create 10 standard users.
10.times do
  User.create!(
    email: Faker::Internet::email,
    password: Faker::Internet::password
  )
end

# Create an admin user.
User.create!(
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  role: "admin"
)

# Create a premium user.
User.create!(
  email: ENV['PREMIUM_EMAIL'],
  password: ENV['PREMIUM_PASSWORD'],
  role: "premium"
)

# Create a standard user.
User.create!(
  email: ENV['STANDARD_EMAIL'],
  password: ENV['STANDARD_PASSWORD'],
)

users = User.all

50.times do
  wiki = Wiki.create!(
    title: Faker::Lorem::sentence,
    body: Faker::Lorem::paragraph,
    user: users.sample,
    private: false
  )

  Collaborator.create!(
    wiki_id: wiki.id,
    user_id: wiki.user.id
  )


end
