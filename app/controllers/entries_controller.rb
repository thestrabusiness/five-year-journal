class EntriesController < ApplicationController
  def index
    @date = DateHelper.new(params[:date]).date
    @five_year_dates = 5.times.collect{ |i| (@date + (i).years) }

    @entries = Entry.grouped_by_date(@five_year_dates)
  end

  def create
    @entry = Entry.create(entry_params)
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:body)
  end
end
