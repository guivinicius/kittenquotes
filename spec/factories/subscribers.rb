FactoryGirl.define do
  factory :subscriber do
    sequence :email do |n|
      "thundercats_#{n}@hoooo.com"
    end
  end
end
