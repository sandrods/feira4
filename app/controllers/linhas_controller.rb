# coding: UTF-8
class LinhasController < ApplicationController
  before_action :set_linha, only: [:show, :edit, :update, :destroy]

  def index
    @search = Linha.search(params[:q])
    @linhas = @search.result.order(:descricao)
  end

  def show
  end

  def new
    @linha = Linha.new
  end

  def edit
  end

  def create
    @linha = Linha.new(linha_params)

    if @linha.save
      redirect_to linhas_path, notice: 'Linha criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @linha.update(linha_params)
      redirect_to linhas_path, notice: 'Linha atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @linha.destroy
    redirect_to linhas_path, notice: 'Linha apagado com sucesso.'
  end

  private
    def set_linha
      @linha = Linha.find(params[:id])
    end

    def linha_params
      params.require(:linha).permit(:descricao)
    end
end