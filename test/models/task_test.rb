require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create Tasks' do
    task = create(:task)
    assert task.persisted?
  end

  test 'the validity of transition StateMachine states of Tasks' do
    task = create(:task)
    assert task.new_task?

    { :into_development => :in_development, :into_qa => :in_qa, :into_code_review => :in_code_review,
      :into_ready_for_release => :ready_for_release, :into_released => :released, :into_archived => :archived }.each_pair do |event, state|
      task.fire_state_event(event)
      assert task.state?(state)
    end
  end
end
