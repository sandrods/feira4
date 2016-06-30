class Vendas::RegistrosController < ApplicationController
  include BelongsToVenda

  def create
    defaults = {
      descricao: "Venda #{@venda.id} - #{@venda.nome}",
      categoria_id: Categoria::VENDAS
    }

    if params[:parcelas] && params[:parcelas].to_i > 1

      parcelas = params[:parcelas].to_i

      valor = ((registro_params[:valor].to_f / parcelas) * 100).to_i.to_f / 100

      data = registro_params[:data].to_date

      parcelas.times do |i|
        defaults[:descricao] = "Venda #{@venda.id} - #{@venda.nome} (#{i+1}/#{parcelas})"
        defaults[:valor] = valor
        defaults[:data] = data
        @registro = @venda.pagamentos.create! registro_params.merge(defaults)
        data = data.next_month
      end

    else
      @registro = @venda.pagamentos.create! registro_params.merge(defaults)
    end
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
