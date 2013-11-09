class Sacola < ActiveRecord::Base
  include ClienteOuVendedor

  has_many :itens, class_name: "ItemSacola", dependent: :destroy do
    def from_barcode(bc)
      ItemSacola.from_barcode(bc, proxy_association.owner.id)
    end
  end

  def total
    itens.incluidos.all.sum { |i| i.item.try(:produto).try(:valor) }
  end

end
