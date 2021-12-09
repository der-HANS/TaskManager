require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'create Tasks' do
    task = create(:task)
    assert task.persisted?
  end

  test 'the validity of transition StateMachine states of Tasks' do
    task = create(:task)
    assert task.new_task?

    { transition_to_development: :in_development, transition_to_qa: :in_qa, transition_to_code_review: :in_code_review,
      transition_to_ready_for_release: :ready_for_release, transition_to_released: :released, transition_to_archived: :archived }.each_pair do |event, state|
      task.fire_state_event(event)
      assert task.state?(state)
    end
  end
end
