::Settings = SimpleConfig.for :application do
  load File.join(Rails.root.to_s, "config", "settings", "application.rb"),   :if_exists? => true
  load File.join(Rails.root.to_s, "config", "settings", "#{Rails.env}.rb"),  :if_exists? => true
  load File.join(Rails.root.to_s, "config", "settings", "local.rb"),         :if_exists? => true
end
