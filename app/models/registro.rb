class Registro < ActiveRecord::Base

  # acts_as_br_date :data
  # acts_as_br_currency :valor

  validates_presence_of :data, :descricao, :valor, :cd

  scope :creditos, where(cd: 'C')
  scope :debitos,  where(cd: 'D')

  scope :da_conta, ->(conta) { where(conta_id: conta) }

  belongs_to :conta
  belongs_to :registravel, polymorphic: true
  belongs_to :categoria

  def valor_cd
    valor * (cd=="D" ? -1 : 1)
  end

end
