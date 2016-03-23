class Vendas::ItensController < ApplicationController
  include BelongsToVenda

  def create
    @item = @venda.adiciona_item!(params[:barcode])
  end

  def destroy
    @venda.itens.find(params[:id]).destroy!
  end

end
