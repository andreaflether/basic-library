class CreateEstantes < ActiveRecord::Migration[5.2]
  def change
    create_table :estantes do |t|
      t.integer :livro_id
      t.integer :user_id

      t.timestamps
    end
  end
end
