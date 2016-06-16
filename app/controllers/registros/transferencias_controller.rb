class Registros::TransferenciasController < ApplicationController

  def new
    @transf = Transferencia.new
    render layout: false
  end

  def create
    @transf = Transferencia.new transf_params

    if @transf.save
    else
      flash[:error] = "Não foi possível salvar registro: #{@transf.errors.full_messages}"
    end

    redirect_to financeiro_diario_path(mes: @transf.data)
  end

 private

  def transf_params
    params.require(:transferencia)
          .permit(:data, :valor, :conta_origem, :conta_destino)
          .delocalize(data: :date, valor: :number)
  end

end
