class Colecao < ActiveRecord::Base

  default_scope -> { order('id desc') }

  def Colecao.to_select
    @@combo ||= Colecao.update_select
  end

  def Colecao.update_select
    @@combo = Colecao.all.map {|c| [c.descricao, c.id]}
  end

end