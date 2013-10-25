class Sacola < ActiveRecord::Base

  has_many :itens, class_name: "SacolaItem", dependent: :destroy

  belongs_to :vendedor

  def total
    itens.incluidos.all.sum { |i| i.item.try(:produto).try(:valor) }
  end

end
