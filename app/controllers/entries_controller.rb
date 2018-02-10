class EntriesController < ApplicationController
  def index
    @date = sanitized_date
    @entries = policy_scope(Entry).grouped_by_date(current_user.five_year_dates)
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.save
    redirect_to entries_path
  end

  def update
    @entry = Entry.find(params[:id])
    authorize @entry
    @entry.update(entry_params)
    redirect_to entries_path
  end

  private

  def entry_params
    params.require(:entry).permit(:id, :body)
  end

  def sanitized_date
    date = DateHelper.new(params[:date]).date

    if date < current_user.start_date
      params[:date] = ''
      Date.current
    else
      date
    end
  end
end
