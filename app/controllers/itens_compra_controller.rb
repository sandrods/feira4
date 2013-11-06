class ItensCompraController < ApplicationController

  before_action :set_compra
  
  def create
    # @item = ItemCompra.from_barcode(params[:barcode], @compra.id)
    @item = @compra.itens.from_barcode(params[:barcode])
  end

  def destroy
    @compra.itens.find(params[:id]).destroy!
  end

 private 

  def set_compra
    @compra = Compra.find(params[:compra_id]) if params[:compra_id]
  end

end
