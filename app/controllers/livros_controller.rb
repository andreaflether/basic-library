class LivrosController < ApplicationController
  before_action :set_livro, only: [:show, :edit, :update, :destroy, :estante]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /livros
  # GET /livros.json
  def index
    if params[:nome]
      @livros = Livro.where('nome LIKE ?', "%#{params[:nome]}%").order('nome ASC')
    else
      @livros = Livro.all.order('created_at DESC').page(params[:page])
  end
  end

  # GET /livros/1
  # GET /livros/1.json
  def show
    @categorias = @livro.assunto.split(',')
  end

  # GET /livros/new
  def new
    @livro = Livro.new
  end

  # GET /livros/1/edit
  def edit
  end

  # POST /livros
  # POST /livros.json
  def create
    @livro = Livro.new(livro_params)

    respond_to do |format|
      if @livro.save
        format.html { redirect_to @livro, notice: 'Livro cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @livro }
      else
        format.html { render :new }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /livros/1
  # PATCH/PUT /livros/1.json
  def update
    respond_to do |format|
      if @livro.update(livro_params)
        format.html { redirect_to @livro, notice: 'Livro atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @livro }
      else
        format.html { render :edit }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /livros/1
  # DELETE /livros/1.json
  def destroy
    @livro.destroy
    respond_to do |format|
      format.html { redirect_to livros_url, notice: 'Livro apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  # Adicionar e remover livros na/da estante para o current_user
  def estante
    tipo = params[:tipo]

    if tipo == 'add'
      current_user.adicoes_estante << @livro
      redirect_to request.referrer, notice: "#{@livro.nome} foi adicionado à sua estante!"
    elsif tipo == 'del'
      current_user.adicoes_estante.delete(@livro)
      redirect_to request.referrer, notice: "#{@livro.nome} foi removido da sua estante."
    else
      # nenhum tipo. nada deve acontecer.
      redirect_to livro_path(@book), alert: "Oops! Algo deu errado. Tente novamente."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_livro
      @livro = Livro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def livro_params
      params.require(:livro).permit(:nome, :autor, :editora, :assunto, :descricao, :thumbnail)
    end
end
