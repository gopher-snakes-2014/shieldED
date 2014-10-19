require "faker"

User.create(username: "Admin",    password_hash: "1234", level: "admin")
User.create(username: "Parent",   password_hash: "1234", level: "parent")
User.create(username: "Student",  password_hash: "1234", level: "student")

500.times do
  User.create(username: Faker::Internet.user_name, password_hash: "123", level: "student")
end

145.times do
  User.create(username: Faker::Internet.user_name, password_hash: "123", level: "parent")
end

User.all.each do |user|
  rand(20).times do
    user.events.create(details:     Faker::Lorem.words(6).join(' '),
                       offender:    Faker::Name.first_name,
                       location:    Faker::Address.city,
                       date:        Faker::Date.between(365.days.ago, 120.days.ago),
                       created_at:  Faker::Date.between(120.days.ago, Date.today))
  end
end

tags = %w(violent verbal cyberbullying exclusion delayed_report one_off repeat_offender racist sexist property_damage threats rumors sexual spam disabilist homophobic stalking body_image theft)
tags.each { |tag| Tag.create(tag_name: tag) }
