class EstanteController < ApplicationController
  before_action :authenticate_user!
  def index
    @livros_estantes = current_user.adicoes_estante
  end
end
