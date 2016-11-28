class Compras::RegistrosController < ApplicationController
  include BelongsToCompra

  def create
    defaults = {
      descricao: "Compra #{@compra.id} - #{@compra.fornecedor.try :nome}",
      categoria_id: Categoria::COMPRAS
    }

    @registro = @compra.pagamentos.create registro_params.merge(defaults)
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
