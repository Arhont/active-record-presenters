require File.join(File.dirname(__FILE__), 'presenter/active_record_extension.rb')
require File.join(File.dirname(__FILE__), 'presenter/action_controller_extension.rb')

module Presenter
  class Base
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def helpers
      @_helpers ||= HelperProxy.new
    end

  end
  # There's some meat in init.rb
  class HelperProxy
    include ActionView::Helpers
  end
end
