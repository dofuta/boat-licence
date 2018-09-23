json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.name_furigana user.name_furigana
end
