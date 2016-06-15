class Calendar
  attr_accessor :date

  def initialize(data = nil)

    if data.is_a? String
      d = Date.parse(data) rescue nil
    else
      d = data
    end

    @date = d || Date.today

  end

  def this_month?(day)
    day.month == @date.month
  end

  def future?
    range.begin.future?
  end

  def past?
    range.last.past?
  end

  def month
    @date.strftime('%m/%Y')
  end

  def last_month
    @date.last_month.strftime('%m/%Y')
  end

  def next_month
    @date.next_month.strftime('%m/%Y')
  end

  def range
    @range ||= @date.beginning_of_month..@date.end_of_month
  end

  def next_cal
    @next_cal ||= Calendar.new(@date.next_month)
  end

end
