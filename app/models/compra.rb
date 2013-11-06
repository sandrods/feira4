class Compra < ActiveRecord::Base

  belongs_to :fornecedor
  has_many :itens, class_name: 'ItemCompra', dependent: :destroy do
    def from_barcode(bc)
      ItemCompra.from_barcode(bc, proxy_association.owner.id)
    end
  end

  has_many :pagamentos, -> { where(cd: 'D').order('data desc')}, class_name: "Registro", as: :registravel

  # acts_as_br_date :data
  # acts_as_br_float :desconto

  def total
    tot = itens.sum(:valor)
    tot = tot * (1 - desconto / 100) if desconto?
    tot
  end

  def desconto?
    desconto.present? && desconto > 0
  end


end