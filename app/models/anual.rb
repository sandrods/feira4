class Anual

  attr_accessor :calendar

  def initialize(ano = nil)
    @calendar = Calendar.new(ano)
    @registros = Registro.where(data: @calendar.range)
  end

  def saldos

    anteriores = Registro.where('data < ?', @calendar.range.begin)
    saldo_inicial = anteriores.creditos.sum(:valor) - anteriores.debitos.sum(:valor)

    registros = @registros.group_by { |r| r.data.month }

    saldos = {}
    saldo_atual = saldo_inicial

    (1..12).each do |mes|
      saldo_do_mes = registros[mes].to_a.sum(&:valor_cd)
      saldo_atual += saldo_do_mes
      saldos[local_month(mes)] = saldo_atual
    end

    saldos

  end

  def local_month(month)
    #I18n.t("date.month_names")[month] # "December"
    #I18n.t("date.abbr_month_names")[month] # "Dec"
    Date.parse("01/#{month}/#{@calendar.year}").to_s(:db)
  end

  class Calendar
    attr_accessor :year

    def initialize(year = nil)
      @year = (year || Date.today.year).to_i
    end

    def last_year
      @year - 1
    end

    def next_year
      @year + 1
    end

    def range
      @range ||= Date.parse("#{@year}-1-1")..Date.parse("#{@year}-12-31")
    end
  end

end
