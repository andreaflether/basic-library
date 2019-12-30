module LivrosHelper

  def user_add_estante? user, livro
    user.estantes.where(user: user, livro: livro).any?
  end

  def nome_livro(livro)
    if livro.length >= 25
      truncate(livro, length: 25)
    else
      livro
    end
  end
end
