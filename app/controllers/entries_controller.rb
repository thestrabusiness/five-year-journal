class EntriesController < ApplicationController
  def index
    @date = DateHelper.new(params[:date]).date
    @five_year_dates = 5.times.collect{ |i| (@date + (i).years) }

    @entries = policy_scope(Entry).grouped_by_date(@five_year_dates)
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
end
