class EntriesController < ApplicationController
  def index
    @date = DateHelper.new(params[:date]).date
    @five_year_dates = 5.times.collect{ |i| (@date + (i-1).years) }

    @entries = Entry.
        where('created_at::DATE IN (?)', @five_year_dates).
        group_by { |entry| entry.created_at.to_date.to_s}

    @entries.each do |date, entry|
      @entries[date] = entry.first if entry.present?
    end
  end
end
