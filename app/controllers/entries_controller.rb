class EntriesController < ApplicationController
  def index
    @date = parsed_date
    @five_year_dates = FiveYearDates.get(date: @date, user: current_user)
    @entries = policy_scope(Entry).grouped_by_date(@five_year_dates)
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.save
    redirect_to entries_path, notice: 'Entry saved!'
  end

  def update
    @entry = Entry.find(params[:id])
    authorize @entry
    @entry.update(entry_params)
    redirect_to entries_path, notice: 'Entry saved!'
  end

  private

  def entry_params
    params.require(:entry).permit(:id, :body)
  end

  def parsed_date
    date = params[:date].present? ? Date.parse(params[:date]) : Date.current

    if date < current_user.start_date
      return current_user.start_date
    end

    if date > current_user.end_date
      return current_user.end_date
    end

    date
  end
end
