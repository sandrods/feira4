class ItensVendaController < ApplicationController

  before_action :set_venda

  def create
    @item = @venda.adiciona_item!(params[:barcode])
  end

  def destroy
    @venda.itens.find(params[:id]).destroy!
  end

 private

  def set_venda
    @venda = Venda.find(params[:venda_id]) if params[:venda_id]
  end

end
