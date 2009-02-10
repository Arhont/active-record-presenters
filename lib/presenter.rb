class Presenter
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def helpers
    @_helpers ||= HelperProxy.new
  end
  
  # There's some meat in init.rb
  class HelperProxy
    include ActionView::Helpers
  end
end
