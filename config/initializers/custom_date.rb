require "date"
require "holiday_jp"

class Date
  def holiday?
    if HolidayJp.holiday?(self)
      return "hd"
    end
  end
end
