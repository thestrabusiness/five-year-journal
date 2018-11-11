#= require rails-ujs
#= require turbolinks
#= require jquery3
#= require popper
#= require bootstrap-sprockets
#= require javascripts/jstz
#= require_tree .

$(document).on 'turbolinks:load', ->
  cookieHelper.setCookie('browser_time_zone', timeZoneHelper.getTimeZone(), 365)
