class Conta < ActiveRecord::Base

  CAIXA = 1
  BANCO = 2
  CPAGAR = 3
  CRECEB = 4

  validates_length_of :nome, maximum: 30

  has_many :registros

  def Conta.to_select
    @@combo ||= Conta.update_select
  end

  def Conta.update_select
    @@combo = Conta.all.map {|c| [c.nome, c.id]}
  end

end