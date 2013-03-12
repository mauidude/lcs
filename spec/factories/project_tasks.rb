# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project_task do
    week { 7.days.ago.beginning_of_week }
    hours 10
    task
    project
  end
end
