FactoryBot.define do
  sequence :string, aliases: [:first_name, :last_name, :password, :name, :description] do |n|
    "string#{n}"
  end

  sequence(:email) { |n| "people#{n}@test.ru" }
  sequence(:avatar) { |n| "people#{n}.jpg" }
end
