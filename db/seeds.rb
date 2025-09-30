require "faker"

puts "Nettoyage de la base..."
Article.destroy_all

puts "Création des articles..."
30.times do
  Article.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraph(sentence_count: 10)
  )
end

puts "30 articles créés avec succès !"