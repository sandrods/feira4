class Compras::RegistrosController < ApplicationController
  include BelongsToCompra

  def create
    @registro = @compra.pagamentos.create registro_params.merge(descricao: "Compra #{@compra.id} - #{@compra.fornecedor.try :nome}")
  end

  def destroy
    @compra.pagamentos.find(params[:id]).destroy!
  end

 private

  def registro_params
    params.require(:registro)
          .permit(:data, :valor, :conta_id)
          .delocalize(data: :date, valor: :number)
  end

end
