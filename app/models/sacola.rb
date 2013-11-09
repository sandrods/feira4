class Sacola < ActiveRecord::Base
  include ClienteOuVendedor

  has_many :itens, class_name: "SacolaItem", dependent: :destroy

  def total
    itens.incluidos.all.sum { |i| i.item.try(:produto).try(:valor) }
  end

end
