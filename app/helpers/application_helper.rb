module ApplicationHelper
  def read_css_asset(name)
    if Rails.application.assets && Rails.application.assets[name]
      content = Rails.application.assets[name].to_s
    else
      content = File.read "#{Rails.root}/public#{stylesheet_path(name, host: nil)}"
    end

    content.gsub(/\n\s*/, '')
  end
end
