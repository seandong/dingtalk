require "test_helper"

class DingtalkTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Dingtalk::VERSION
  end
end
