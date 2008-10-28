ActiveSupport::Dependencies.load_paths << File.join(Rails.root, 'app', 'presenters')

require 'presenter'
require 'active_record_extension'
