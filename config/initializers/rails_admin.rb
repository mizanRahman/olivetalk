RailsAdmin.config do |config|
  config.authorize_with :cancan
  config.included_models = [ "Profile", "Badge", "Badgeship", "Degree", "Job", "Network", "Post", "Resource", "Topic", "Role","Topic","University","User"]
  
  # config.model 'Profile' do
  #   object_label_method do
  #     :custom_label_method
  #   end
  # end

  # def custom_label_method
  #   "#{self.first_name} #{self.last_name}"
  # end
end