FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn  { "0820472670" }
    price { Faker::Commerce.price }
    year_publication { Faker::Date }
    image_url { Faker::Avatar.image(slug: "my-own-slug", size: "50x50") }
    edition { Faker::Number.between(from: 1, to: 20) }
    publisher { 1 }

    factory :book_valid do
      title { Faker::Book.title }
      isbn  { "074324382X" }
      price { Faker::Commerce.price }
      year_publication { Faker::Date }
      image_url { Faker::Avatar.image(slug: "my-own-slug", size: "50x50") }
      edition { Faker::Number.between(from: 1, to: 20) }
      publisher { 1 }
    end

    factory :invalid_isbn do
      title { Faker::Book.title }
      isbn  { "123456790" } # 0820472670X
      price { Faker::Commerce.price }
      year_publication { Faker::Date }
      image_url { Faker::Avatar.image(slug: "my-own-slug", size: "50x50") }
      edition { Faker::Number.between(from: 1, to: 20) }
      publisher { 1 }
    end

  end
end
