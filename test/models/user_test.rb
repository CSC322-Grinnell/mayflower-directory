require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'invalid without email' do
    user = users(:normal)
    user.email = nil
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

end
