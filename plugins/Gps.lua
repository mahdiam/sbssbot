do

function run(msg, matches)
  local lat = matches[1]
  local lon = matches[2]
  local receiver = get_receiver(msg)

  local zooms = {16, 18}
  local urls = {}
  for i = 1, #zooms do
    local zoom = zooms[i]
    local url = "http://maps.googleapis.com/maps/api/staticmap?zoom=" .. zoom .. "&size=600x300&maptype=roadmap&center=" .. lat .. "," .. lon .. "&markers=color:blue%7Clabel:X%7C" .. lat .. "," .. lon
    table.insert(urls, url)
  end

  send_photos_from_url(receiver, urls)

  return "www.google.es/maps/place/@" .. lat .. "," .. lon
end

return {
  description = "Generate Map for GPS Coordinates", 
  usage = "جی پی اس (latitude,longitude) : generate map by gps cods",
  patterns = {"^جی پی اس ([^,]*)[,%s]([^,]*)$"}, 
  run = run 
}

end
