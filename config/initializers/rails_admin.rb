RailsAdmin.config do |config|
  config.main_app_name = ["Cool app", "BackOffice"]
  # or somethig more dynamic
  config.main_app_name = Proc.new { |controller| [ "Cool app", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
end
