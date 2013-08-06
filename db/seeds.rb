# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ["Bikes","Parts","Forks","Wheelsets","Vintage","Other"]

categories.each do |category|
	Category.create(name: category)
end

User.create!(fname: "Bryan",
                 lname: "Heu",
                 email: "teamriab@gmail.com",
                 password: "bryanus",
                 password_confirmation: "bryanus")
    5.times do |n|
      fname  = Faker::Name.first_name
      lname  = Faker::Name.last_name
      email = "user#{n+1}@gmail.com"
      password  = "bryanus"
      User.create!(fname: fname,
                   lname: lname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    50.times do
      Post.create!(title: Faker::Lorem.sentence(word_count = 4),
                   description: Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false),
                   price: rand(50..1999),
                   user_id: rand(1..6),
                   category_id: rand(1..6),
                   adtype: rand(0..1))
    end