# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = [ "Bikes: Full Suspension", "Bikes: Hardtail", "Bikes: Vintage", "Bikes: BMX", "Bikes: Framesets", "Components: Brakes", "Components: Chain and Cassette", "Components: Crankset", "Components: Derailleurs", "Components: Front Forks", "Components: Rear Shocks", "Components: Handlebars", "Components: Headsets", "Components: Pedals", "Components: Saddles", "Components: Seatposts", "Components: Shifters", "Components: Stems", "Components: Vintage Parts", "Components: Other Components", "Wheels: Wheelsets", "Wheels: Hubs", "Wheels: Tires", "Accessories: Clothes and Body Armor", "Accessories: Racks", "Accessories: Helmets", "Accessories: Lights", "Accessories: Shoes", "Accessories: Trainers", "Accessories: Other"]

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

    64.times do
      Post.create!(title: Faker::Lorem.sentence(rand(2..10)).chomp('.'),
                   description: Faker::Lorem.paragraphs(rand(2..8)).join("\n\n"),
                   price: rand(50..1999),
                   zip: rand(00100..99999),
                   user_id: rand(1..6),
                   category_id: rand(1..6),
                   adtype: rand(0..1))
    end