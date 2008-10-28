class Presenter
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def helpers
    ActionController::Base.helpers
  end
end
