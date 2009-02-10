ActiveSupport::Dependencies.load_paths << File.join(Rails.root, 'app', 'presenters')

require 'presenter'
require 'active_record_extension'

class << ActionController::Base
  def add_template_helper_with_presenters(helper_module, *args, &block)
    # Hijacking any helper added to controllers so that our presenters can acces 'em.
    Presenter::HelperProxy.instance_eval { include helper_module }
    add_template_helper_without_presenters(helper_module, *args, &block)
  end
  
  alias_method_chain :add_template_helper, :presenters
end