class ApplicationController < ActionController::Base
  include Pundit
  include Oath::ControllerHelpers

  protect_from_forgery with: :exception

  before_action :update_user_time_zone, if: :current_user
  around_action :set_time_zone, if: :current_user

  private

  def set_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  def update_user_time_zone
    browser_tz = cookies[:browser_time_zone].presence
    return unless browser_tz && current_user.time_zone != browser_tz
    current_user.update(time_zone: browser_tz)
  end
end
