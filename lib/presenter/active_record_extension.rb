module ActiveRecord
  class NoPresenter < StandardError; end
  class Base

    class << self
      attr_accessor :presenter_class

      def presenter(presenter)
        self.presenter_class = presenter
      end
    end

    def presents
      @presenter ||= set_presenter
      block_given? ? yield(@presenter) : @presenter
    end
    alias :presenter :presents

    def set_presenter
      presenter_name = if self.class.presenter_class
        self.class.presenter_class.to_s.capitalize
      else
        self.class.name
      end
      "#{presenter_name}Presenter".constantize.new(self)
    rescue NameError
      raise NoPresenter, "No presenter has been created for the #{self.class.name} model"
    end
  end
end
