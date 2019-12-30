class Livro < ApplicationRecord
  paginates_per 5
  has_one_attached :thumbnail
  has_many :estantes
  has_many :livros_add, through: :estantes, source: :user
end
