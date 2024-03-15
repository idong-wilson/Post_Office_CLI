require 'minitest/autorun'
require_relative '../package'
require_relative '../post_office'

class PostOfficeTest < Minitest::Test
  def setup
    @post_office = PostOffice.new
  end

  def test_add_package
    @post_office.add_package
    assert_equal 1, @post_office.instance_variable_get(:@packages).size
  end
  def test_track_package
    tracking_number = "123456"
    destination = "New York"
    @post_office.instance_variable_get(:@packages) << Package.new(tracking_number, destination)
    assert_output(/Package found:/) { @post_office.track_package }
  end
end
