# coding: UTF-8
class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :edit, :update, :destroy]

  def index
    @search = Fornecedor.search(params[:q])
    @fornecedores = @search.result.order(:nome)
  end

  def show
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def edit
  end

  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      redirect_to fornecedores_path, notice: 'Fornecedor criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @fornecedor.update(fornecedor_params)
      redirect_to fornecedores_path, notice: 'Fornecedor atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @fornecedor.destroy
    redirect_to fornecedores_path, notice: 'Fornecedor apagado com sucesso.'
  end

  private
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :email)
    end
end