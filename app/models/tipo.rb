class Tipo < ActiveRecord::Base

  def Tipo.to_select
    @@combo ||= Tipo.update_select
  end
  
  def Tipo.update_select
    @@combo = Tipo.all.map {|c| [c.descricao, c.id]}
  end

end
