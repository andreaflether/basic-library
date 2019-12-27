module LivrosHelper

  def user_add_estante? user, livro
    user.estantes.where(user: user, livro: livro).any?
  end
end
