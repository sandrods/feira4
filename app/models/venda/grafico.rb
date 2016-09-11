class Venda::Grafico

  attr_accessor :calendar

  def initialize(data)
    @calendar = Calendar.new(data)
    @vendas = Venda.where(data: @calendar.range)
    @itens = ItemEstoque.vendidos.where(movimento_id: @vendas.pluck(:id))
  end

  def quantidade_por_mes
    Hash[@itens.to_a.group_by_month { |i| i.movimento.data }.map { |k, v| [k.to_s(:db), v.count] }]
  end

  def valor_por_mes
    Hash[@vendas.to_a.group_by_month(format: "%b %Y", &:data).map { |k, v| [k, v.sum(&:total)] }]
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
