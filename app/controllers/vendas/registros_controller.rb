class Vendas::RegistrosController < ApplicationController
  include BelongsToVenda

  def create
    @registro = @venda.pagamentos.create registro_params.merge(descricao: "Venda #{@venda.id}: #{@venda.nome}")
  end

 private

  def registro_params
    params.require(:registro).permit(:data, :valor, :conta_id)
  end

end
