class RegistrosController < ApplicationController

  def index
  end

  def new
    @registro = Registro.new
  end

  def edit
    @registro = Registro.find params[:id]
    render layout: false
  end

end
