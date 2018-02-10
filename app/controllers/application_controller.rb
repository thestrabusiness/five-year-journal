class ApplicationController < ActionController::Base
  include Pundit
  include Oath::ControllerHelpers

  protect_from_forgery with: :exception
end
