module ActiveRecord
  class NoPresenter < StandardError; end
  class Base
    def presents
      @presenter ||= set_presenter
    end

    def set_presenter
      "#{self.class.name}Presenter".constantize.new(self)
    rescue NameError
      raise NoPresenter, "No presenter has been created for the #{self.class.name} model"
    end
  end
end
