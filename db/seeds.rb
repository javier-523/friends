# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning up old records..."
Friend.destroy_all
User.destroy_all

puts "Creating 5 unique users..."
users = []

5.times do |i|
  users << User.create!(
    email: "user#{i+1}@example.com", # Easy predictable emails for logging in
    password: "password123",         # Devise requires a valid password to pass validations
    password_confirmation: "password123"
  )
end

# 2. Generate 50 fake friends, 10 for each of the 5 users
puts "Generating 50 fake friends..."
users.each do |user|
    10.times do
    user.friends.create!(
        first_name:  Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name,
        email: Faker::Internet.unique.email,
        phone: Faker::PhoneNumber.cell_phone,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        salary_amt: Faker::Number.decimal(l_digits: 5, r_digits: 2),
        isbest: Faker::Boolean.boolean
    )
    end
    
end

puts "🎉 Seed complete!"
puts "🎉 Successfully created #{User.count} users!"
puts "🎉 Successfully created #{Friend.count} records!"