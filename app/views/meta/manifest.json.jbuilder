json.name Settings.site_name
json.short_name Settings.short_site_name
json.lang Settings.language
json.dir Settings.text_direction

json.icons [192, 512] do |size|
  json.src "/android-chrome-#{size}x#{size}.png"
  json.sizes "#{size}x#{size}"
  json.type 'image/png'
end

json.theme_color Settings.theme_color
json.background_color Settings.theme_color

json.start_url '/'
json.display 'standalone'
json.orientation 'portrait'
