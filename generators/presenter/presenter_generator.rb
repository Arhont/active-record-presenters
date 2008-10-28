class PresenterGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.directory 'app/presenters'
      m.template 'presenter_template.rb', "app/presenters/#{file_path}_presenter.rb"
    end
  end
end
