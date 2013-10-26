# coding: UTF-8
class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def index
    if params[:letra]
      @clientes = Cliente.por_letra(params[:letra])
      @search = Cliente.search
    else
      @search = Cliente.search(params[:q])
      @clientes = @search.result.order(:nome)
    end
  end

  def show
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      redirect_to clientes_path, notice: 'Cliente criado com sucesso.'
    else
      render action: 'new'
    end
  end

  def update
    if @cliente.update(cliente_params)
      redirect_to clientes_path, notice: 'Cliente atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @cliente.destroy
    redirect_to clientes_path, notice: 'Cliente apagado com sucesso.'
  end

  private
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    def cliente_params
      params.require(:cliente).permit(:nome, :email, :fone_res, :fone_com, :fone_cel, :endereco, :bairro, :cep, :cidade, :uf, :obs)
    end
end