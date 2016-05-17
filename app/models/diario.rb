class Diario

  attr_accessor :calendar, :contas

  def initialize(data)
    @calendar = Calendar.new(data)
    @contas = ::Conta.all.map { |c| Conta.new(c, @calendar.range) }
    @registros = Registro.where(data: @calendar.range)
  end

  def a_pagar
    @registros.a_pagar
  end

  def a_pagar_total
    a_pagar.sum(:valor)
  end

  def a_receber
    @registros.a_receber
  end

  def a_receber_total
    a_receber.sum(:valor)
  end

  def saldos

    anteriores = Registro.where('data < ?', @calendar.range.begin)
    saldo_inicial = anteriores.creditos.sum(:valor) - anteriores.debitos.sum(:valor)

    registros = @registros.group_by(&:data)

    saldos = {}
    saldo_atual = saldo_inicial

    @calendar.range.each do |dia|
      saldo_do_dia = registros[dia].to_a.sum(&:valor_cd)
      saldo_atual += saldo_do_dia
      saldos[dia.day] = saldo_atual
    end

    saldos

  end

  class Conta

    def initialize(conta, range)
      @range = range
      @conta = conta
    end

    delegate :nome, to: :@conta

    def registros
      @conta.registros.where(data: @range)
    end

    def saldo
      r = @conta.registros.where('data < ?', @range.last)
      r.creditos.pagos.sum(:valor) - r.debitos.pagos.sum(:valor)
    end

  end


end
