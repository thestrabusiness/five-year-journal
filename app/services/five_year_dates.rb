class FiveYearDates
  attr_reader :date, :user

  def initialize(date:, user:)
    @date = date
    @user = user
  end

  def self.get(date:, user:)
    new(date: date, user: user).get
  end

  def get
    5.times.collect { |i| start_date + i.years}
  end

  private

  def start_date
    Date.new(start_year, date.month, date.day)
  end

  def start_year
    if date_before_user_start?
      user.start_date.year + 1
    else
      user.start_date.year
    end
  end

  def date_before_user_start?
    date.month <= user.start_date.month && date.day < user.start_date.day
  end
end
