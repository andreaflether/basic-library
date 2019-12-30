class EditBookFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :livros, :quantidade
    add_column :livros, :descricao, :text
  end
end
