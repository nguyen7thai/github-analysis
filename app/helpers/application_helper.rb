module ApplicationHelper
  def include_controller_javascript
    controller_name = params[:controller]
    if File.exist? "#{Rails.root}/app/assets/javascripts/controllers/#{controller_name}.js"
      javascript_include_tag "controllers/#{controller_name}"
    end
  end
end
