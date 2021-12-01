FactoryBot.define do
  factory :task do
    name
    description
    author factory: :manager
    assignee factory: :developer
    state { [:new_task, :in_development, :archived, :in_qa, :in_code_review, :ready_for_release, :released].sample.to_s }
    expired_at { Time.now + 24.hours }
  end
end
