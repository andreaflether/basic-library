json.extract! livro, :id, :nome, :autor, :editora, :assunto, :quantidade, :created_at, :updated_at
json.url livro_url(livro, format: :json)
