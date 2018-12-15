json.lessons @lessons do |lesson|
  json.id       lesson.id
  json.type     lesson_type(lesson.type_number)
  json.date     simple_date(lesson.date)

  json.ignore_nil!
  json.place    lesson.place ? lesson.place.facility_name : "未登録"

  json.gg_event gg_event?(lesson.gg_event_id)

  json.ignore_nil!
  json.teachers lesson.teachers.map{|teacher| teacher.name}.join(", ")

  json.ignore_nil!
  json.boats lesson.boats.map{|boat| boat.name}.join(", ")

  json.ignore_nil!
  json.remark   lesson.remark
end
