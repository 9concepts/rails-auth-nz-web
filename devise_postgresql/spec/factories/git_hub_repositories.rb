FactoryBot.define do
  factory :git_hub_repository do
    sequence(:id) {|n| n}
    full_name { "9sako6/rails" }
    description { "playground of rails" }
  end
end
