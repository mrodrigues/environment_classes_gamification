# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    turn_id 1
    answer_id 1
    characteristics "MyText"
    delta_population 1.5
    delta_public_support 1.5
    delta_corporate_support 1.5
    delta_balance 1.5
  end
end
