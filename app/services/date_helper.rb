class DateHelper
  attr_reader :date

  def initialize(date = nil)
    parsed_date = Date.parse(date) if date.present?
    @date = parsed_date || Date.current
  end

  def next_date
    date + 1.day
  end

  def previous_date
    date - 1.day
  end
end
