# coding: UTF-8
class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy]

  def index
    @search = Venda.search(params[:q])
    @vendas = @search.result.order('id desc')
  end

  def show
  end

  def new
    @venda = Venda.new
    @venda.data = Date.today
  end

  def edit
  end

  def create

    from_sacola and return if params[:sacola_id]

    @venda = Venda.new(venda_params)

    if @venda.save
      redirect_to @venda, notice: 'Venda criado com sucesso.'
    else
      render action: 'new'
    end

  end

  def update
    if @venda.update(venda_params)
      redirect_to @venda, notice: 'Venda atualizado com sucesso.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @venda.destroy
    redirect_to vendas_path, notice: 'Venda apagado com sucesso.'
  end

  private
    def set_venda
      @venda = Venda.find(params[:id])
    end

    def venda_params
      params.require(:venda).permit(:cliente_id, :desconto, :data)
    end

    def from_sacola
      @venda = Venda.from_sacola(params[:sacola_id])
      redirect_to @venda, notice: 'Venda criado com sucesso.' 
    end

end