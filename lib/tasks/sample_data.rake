# namespace :db do
#   desc "Fill database with sample data"
#   task populate: :environment do
#     User.create!(fname: "Bryan",
#                  lname: "Heu",
#                  email: "teamriab@gmail.com",
#                  password: "bryanus",
#                  password_confirmation: "bryanus")
#     5.times do |n|
#       fname  = Faker::Name.first_name
#       lname  = Faker::Name.last_name
#       email = "user#{n+1}@gmail.com"
#       password  = "bryanus"
#       User.create!(fname: fname,
#                    lname: lname,
#                    email: email,
#                    password: password,
#                    password_confirmation: password)
#     end

#     50.times do
#       Post.create!(title: Faker::Lorem.sentence(word_count = 4),
#                    description: Faker::Lorem.paragraphs(paragraph_count = 3, supplemental = false),
#                    price: rand(50..1999),
#                    user_id: rand(1..6),
#                    category_id: rand(1..6),
#                    adtype: rand(0..1))
#     end

#   end
# end