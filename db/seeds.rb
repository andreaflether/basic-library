# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do
  Livro.create ([{
  # Random Book Title
  nome: Faker::Book.title,

  # Random Author
  autor: Faker::Book.author,

  # Random Publisher
  editora: Faker::Book.publisher,

  # Random Genre
  assunto: Faker::Book.genre,

  # Random number between 1 and 12
  quantidade: Faker::Number.between(from: 1, to: 12)
  }])
end
