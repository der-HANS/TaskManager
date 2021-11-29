require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create Tasks' do
    task = create(:task)
    assert task.persisted?
  end
end
