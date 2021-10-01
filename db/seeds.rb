# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create(email: 'user1@test.com', password: 'password', password_confirmation: 'password')
user_2 = User.create(email: 'user2@test.com', password: 'password', password_confirmation: 'password')

language_1 = Language.create(name: 'English')
language_2 = Language.create(name: 'German')

5.times do |i|
    word = Word.create(content: Faker::Lorem.word, language: language_1, user: user_1)
    word = Word.create(content: Faker::Lorem.word, language: language_2, user: user_1)
end

5.times do |i|
    word = Word.create(content: Faker::Lorem.word, language: language_1, user: user_2)
    word = Word.create(content: Faker::Lorem.word, language: language_2, user: user_2)
end