require 'rubygems'
require 'active_record'
require 'action_controller' # because we use helpers
require 'test/unit'

# Mocking Rails.root
Rails = Object.new
class << Rails
  def root
    'foo'
  end
end

# The paths.
$: << File.join(File.dirname(__FILE__), '..', 'lib')
require File.join(File.dirname(__FILE__), '..', 'init.rb')

# The database
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
ActiveRecord::Schema.define(:version => 1) do
  create_table :posts do |t|
    t.string :title
    t.text :body
  end

  create_table :foos do |t|
    t.string :lulz
  end
end

# Models
class Post < ActiveRecord::Base; end
class Foo < ActiveRecord::Base; end

# A presenter.
class PostPresenter < Presenter
  def title
    object.title.titleize
  end

  def body
    helpers.textilize(object.body)
  end
end

class PesenterTest < Test::Unit::TestCase
  def setup
    @post = Post.create(:title => "Hello to you", :body => "Yes, a *post*!")
  end

  def test_presenting_title
    assert_equal @post.title.titleize, @post.presents.title
  end

  def test_presenting_body
    assert_equal "<p>Yes, a <strong>post</strong>!</p>", @post.presents.body
  end

  def test_no_presenter
    f = Foo.new
    assert_raises(ActiveRecord::NoPresenter) { f.presents.nothing }
  end
end
