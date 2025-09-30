require "faker"

puts "Nettoyage de la base..."
Article.destroy_all
User.destroy_all

puts "Création des utilisateurs..."
users = 5.times.map do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password'
  )
end

puts "Création des articles..."
30.times do
  Article.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 10),
    user: users.sample
  )
end

puts "30 articles créés avec succès !"