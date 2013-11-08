class ItensVendaController < ApplicationController

  before_action :set_venda
  
  def create
    # @item = ItemCompra.from_barcode(params[:barcode], @compra.id)
    @item = @venda.itens.from_barcode(params[:barcode])
  end

  def destroy
    @venda.itens.find(params[:id]).destroy!
  end

 private 

  def set_venda
    @venda = Venda.find(params[:venda_id]) if params[:venda_id]
  end

end
