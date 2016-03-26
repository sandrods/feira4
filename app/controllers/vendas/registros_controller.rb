class Vendas::RegistrosController < ApplicationController
  include BelongsToVenda

  def create
    @registro = @venda.pagamentos.create registro_params.merge(descricao: "Venda #{@venda.id} - #{@venda.nome}")
  end

  def destroy
    @venda.pagamentos.find(params[:id]).destroy!
  end

 private

  def registro_params
    params.require(:registro)
          .permit(:data, :valor, :forma_id)
          .delocalize(data: :date, valor: :number)
  end

end
