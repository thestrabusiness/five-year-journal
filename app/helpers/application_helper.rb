module ApplicationHelper
  def entry_display_date
    params[:date].present? ? Date.parse(params[:date]) : Date.current
  end

  def entry_body_or_form_partial(date)
    date == Date.current ? 'body_form' : 'body'
  end
end
