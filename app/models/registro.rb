class Registro < ActiveRecord::Base

  before_create :registrar_data_pagamento
  before_save :registrar_conta_forma_pagamento

  # acts_as_br_date :data
  # acts_as_br_currency :valor

  validates_presence_of :data, :descricao, :valor, :cd

  scope :creditos, -> { where(cd: 'C') }
  scope :debitos,  -> { where(cd: 'D') }

  scope :pendentes,  -> { where(data_pagamento: nil) }

  scope :da_conta, ->(conta) { where(conta_id: conta) }

  belongs_to :conta
  belongs_to :registravel, polymorphic: true
  belongs_to :categoria
  belongs_to :forma

  def pendente?
    data_pagamento.nil?
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

private

  def registrar_data_pagamento
    # registro já nasce conciliado se não for criado em data futura
    data_pagamento = data if data <= Date.today
  end

  def registrar_conta_forma_pagamento
    # se trocar a forma de pagamento de registro ainda não consolidado,
    # a conta deve ser trocada de forma correspondente
    conta = forma.conta if pendente? && forma.conta
  end

end
