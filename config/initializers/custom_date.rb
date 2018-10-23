require "date"
require "holiday_jp"

class Date
  def holiday?
    if HolidayJp.holiday?(self)
      return "hd"
    end
  end
  def sun_or_sat?
    case self.wday
    when 0
      return "sun"
    when 6
      return "sat"
    else
      return ""
    end
  end
  def jitugi
    return Lesson.where(type_number: 0).where(date: self).includes(:users)
  end
  def syokyuu
    return Lesson.where(type_number: 1).where(date: self).includes(:users)
  end
  def joukyuu
    return Lesson.where(type_number: 2).where(date: self).includes(:users)
  end
  def tokusyu
    return Lesson.where(type_number: 3).where(date: self).includes(:users)
  end
  def kosen
    return Lesson.where(type_number: 4).where(date: self).includes(:users)
  end
end
