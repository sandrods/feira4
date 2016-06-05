class Colecao < ActiveRecord::Base

  default_scope -> { order('id desc') }

  def Colecao.to_select
    Colecao.all.map {|c| [c.descricao, c.id]}
  end

end
