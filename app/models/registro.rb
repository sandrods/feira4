class Registro < ActiveRecord::Base

  before_create :registrar_conta_forma_pagamento
  before_create :registrar_pagamento

  # acts_as_br_date :data
  # acts_as_br_currency :valor

  validates_presence_of :data, :descricao, :valor, :cd

  scope :creditos, -> { where(cd: 'C').order(:data) }
  scope :debitos,  -> { where(cd: 'D').order(:data) }

  scope :pendentes,  -> { where(pago: false) }
  scope :pagos,      -> { where(pago: true) }

  scope :da_conta, ->(conta) { where(conta_id: conta) }

  belongs_to :conta
  belongs_to :registravel, polymorphic: true
  belongs_to :categoria
  belongs_to :forma

  def pendente?
    !pago
  end

  def self.a_pagar
    debitos.pendentes
  end

  def self.a_receber
    creditos.pendentes
  end

  def valor_cd
    valor * (cd=="D" ? -1 : 1)
  end

  def receita?
    cd.upcase == 'C'
  end

  def despesa?
    !receita?
  end

private

  def registrar_pagamento
    # registro já nasce conciliado se não for criado em data futura
    self.pago = true if data <= Date.today
  end

  def registrar_conta_forma_pagamento
    return unless forma && forma.conta

    self.conta_id = forma.conta_id
  end

end
