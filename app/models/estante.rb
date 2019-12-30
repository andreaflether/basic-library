class Estante < ApplicationRecord
  belongs_to :livro 
  belongs_to :user
end
