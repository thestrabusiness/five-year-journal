module ApplicationHelper
  def entry_display_date
    params[:date].present? ? Date.parse(params[:date]) : Date.current
  end
end
