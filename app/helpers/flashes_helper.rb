module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice("success", "info", "danger", "warning")
  end
end
