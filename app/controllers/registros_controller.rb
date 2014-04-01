class RegistrosController < ApplicationController

  def index
  end

  def new
    @registro = Registro.new
  end

end
