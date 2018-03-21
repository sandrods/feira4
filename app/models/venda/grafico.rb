class Venda::Grafico

  attr_accessor :calendar

  delegate :year, to: :calendar

  def initialize(data)
    @calendar = Calendar.new(data)
    @vendas = Venda.where(data: @calendar.range)
    @itens = ItemEstoque.vendidos.where(movimento_id: @vendas.pluck(:id))

    @itens_por_mes = @itens.to_a.group_by_month { |i| i.movimento.data }
  end

  def quantidade_por_mes
    all_months Hash[@itens_por_mes.map { |k, v| [k, v.count] }]
  end

  def valor_por_mes
    all_months Hash[@itens_por_mes.map { |k, v| [k, v.sum(&:valor)] }]
  end

  def last_year
    @last ||= Venda::Grafico.new @calendar.last_year
  end

  def all_months(serie)
    ret = {}
    (1..12).each do |mes|
      dt = Date.new(@calendar.year, mes, 1)
      dt_fmt = dt.strftime('%b %Y')
      ret[dt_fmt] = serie.fetch(dt, 0)
    end
    ret
  end

  # def valor_por_mes
  #   Hash[@vendas.to_a.group_by_month(format: "%b %Y", &:data).map { |k, v| [k, v.sum(&:total)] }]
  # end

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
