class CreateLivros < ActiveRecord::Migration[5.2]
  def change
    create_table :livros do |t|
      t.string :nome
      t.string :autor
      t.string :editora
      t.string :assunto
      t.integer :quantidade

      t.timestamps
    end
  end
end
