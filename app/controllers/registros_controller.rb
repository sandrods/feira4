class RegistrosController < ApplicationController

  def new
    @registro = Registro.new(cd: params[:cd])
    render layout: false
  end

  def create
    @registro = Registro.new registro_params
    if @registro.save
    else
      flash[:error] = "Não foi possível salvar registro: #{@registro.errors.full_messages}"
    end

    redirect_to financeiro_diario_path(mes: @registro.data)
  end

  def edit
    @registro = Registro.find params[:id]
    render layout: false
  end

  def update
    @registro = Registro.find params[:id]

    if @registro.update registro_params
    else
      flash[:error] = "Não foi possível salvar registro: #{@registro.errors.full_messages}"
    end

    redirect_to financeiro_diario_path(mes: @registro.data)
  end

  private

   def registro_params
     params.require(:registro)
           .permit(:data, :valor, :conta_id, :forma_id, :descricao, :pago, :cd, :categoria_id)
           .delocalize(data: :date, valor: :number)
   end

end
