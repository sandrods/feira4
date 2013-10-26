class Compra < ActiveRecord::Base

  belongs_to :fornecedor
  has_many :itens, class_name: 'CompraItem', dependent: :destroy

  has_many :pagamentos, -> { where(cd: 'D').order('data desc')}, class_name: "Registro", as: :registravel

  # acts_as_br_date :data
  # acts_as_br_float :desconto

  def total
    itens.sum(:valor)
  end

end