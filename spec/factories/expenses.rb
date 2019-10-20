FactoryBot.define do
  factory :expense do |f|
    user

    f.name { "MyString" }
    f.amount { "9.99" }
    f.status { :unstarted }
  end
end
