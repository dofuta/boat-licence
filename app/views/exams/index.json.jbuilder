json.user_id @user_id
json.exams @exams do |exam|
  json.id       exam.id
  json.type     exam_type(exam.type_number)
  json.date     simple_date(exam.date)
  json.place    exam.place.facility_name
  json.announcement_date simple_date(exam.announcement_date)
  json.gg_event gg_event?(exam.gg_event_id)

  json.ignore_nil!
  json.remark   exam.remark
end
