json.array! @books do |book|
  json.id book.id
  json.name book.name
  json.price book.price
  json.is_recommended book.is_recommended
end
