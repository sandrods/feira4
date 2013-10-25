class Cor < ActiveRecord::Base

  def Cor.to_select
    @@combo ||= Cor.update_select
  end
  
  def Cor.update_select
    @@combo = Cor.all.map {|c| [c.nome, c.id]}
  end

end
