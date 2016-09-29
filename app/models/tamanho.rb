class Tamanho < ActiveRecord::Base

  has_many :itens, dependent: :restrict_with_error

  default_scope -> { order('nome desc') }

  def Tamanho.to_select
    @@combo ||= Tamanho.update_select
  end

  def Tamanho.update_select
    @@combo = Tamanho.all.map {|c| [c.nome, c.id]}
  end

end
