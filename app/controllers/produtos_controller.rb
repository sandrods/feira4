# coding: UTF-8
class ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]

  def index
    @search = Produto.search(params[:q])
    @produtos = @search.result.order(:ref)
  end

  def show
  end

  def new
    @produto = Produto.new
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to produtos_path, notice: 'Produto criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @produto.update(produto_params)
      redirect_to produtos_path, notice: 'Produto atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @produto.destroy
    redirect_to produtos_path, notice: 'Produto apagado com sucesso.'
  end

  def lucro
    custo = params[:custo].gsub(',', '.').to_f
    valor = params[:valor].gsub(',', '.').to_f
    @lucro = Produto.lucro(valor, custo)
    @rentab = Produto.rentabilidade(valor, custo)

    render json: { lucro: view_context.number_to_currency(@lucro), rentabilidade: view_context.number_to_percentage(@rentab) }

  end

  private
    def set_produto
      @produto = Produto.find(params[:id])
    end

    def produto_params
      params.require(:produto).permit(:ref, :colecao_id, :tipo_id, :fornecedor_id, :linha_id)
    end
end