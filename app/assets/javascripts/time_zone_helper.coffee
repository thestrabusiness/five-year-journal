class timeZoneHelper
  getTimeZone: ->
    OLD_INTL = window.Intl
    try
      window.Intl = undefined
      tz = jstz.determine().name()
      window.Intl = oldIntl
      tz
    catch
      jstz.determine().name()

window.timeZoneHelper = new timeZoneHelper()
