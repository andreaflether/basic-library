class EstanteController < ApplicationController
  before_action :authenticate_user!
  def index
    @livros_estante = current_user.adicoes_estante
  end
end
