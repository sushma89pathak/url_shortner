FactoryGirl.define do
  factory :urlconvertor, class: "UrlConvertor" do
    original_url "test.123.com"
    short_url "8Abc32"
  end

  factory :urlconvertor2, class: "UrlConvertor"  do
    original_url "test1.123.com"
    short_url "8Abc32"
  end

  factory :urlconvertor3, class: "UrlConvertor"  do
    original_url "test1.123.com"
    short_url "8Abc321"
  end

  factory :urlconvertor4, class: "UrlConvertor"  do
    original_url "test.123.com"
  end
end
