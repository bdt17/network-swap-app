FactoryBot.define do
  factory :drone do
    drone_fleet { nil }
    site { nil }
    name { "MyString" }
    vendor_identifier { "MyString" }
    status { 1 }
    online { false }
    battery_level { 1 }
  end
end
