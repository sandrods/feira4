class RegistrosController < ApplicationController

  def index
    @diario = Diario.new(params[:mes])
  end

  def new
    @registro = Registro.new(cd: params[:cd])
    render layout: false
  end

  def create
    @registro = Registro.new registro_params
    @registro.save!

    redirect_to registros_path
  end

  def edit
    @registro = Registro.find params[:id]
    render layout: false
  end

  def update
    @registro = Registro.find params[:id]
    @registro.update! registro_params

    redirect_to registros_path
  end

  private

   def registro_params
     params.require(:registro)
           .permit(:data, :valor, :conta_id, :forma_id, :descricao, :pago, :cd)
           .delocalize(data: :date, valor: :number)
   end

end
