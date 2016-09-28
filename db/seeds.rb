
User.create(email: "s@s.com", business_name: Faker::Company.name, password: "password",  first_name:"SupplierA", phone_number: "+17329866193", role: 2, status: 1)
User.create(email: "r@r.com", business_name: Faker::Company.name, password: "password",  first_name:"RetailerA", phone_number: "+17329866193", role: 1, status: 1)
User.create(email: "2a@a.com", business_name: Faker::Company.name, password: "password",  first_name:"AdminA", phone_number: "+17329866193", role: 4, status: 1)

40.times do
  User.create(email: Faker::Internet.email,
              password: "password",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              role: rand(1..3),
              business_name: Faker::Company.name,
              tax_id: Faker::Company.ein,
              phone_number: "+15005550006",
              street_address: Faker::Address.street_address,
              city: Faker::Address.city,
              state: Faker::Address.state,
              zip_code: Faker::Address.city,
              in_biz: rand(15),
              account_number: Faker::Code.asin,
              role: rand(0..4),
              status: 1
              )
end

100.times do
  Station.create(brand: ["BP", "Shell", "Exxon", "GULF", "Delta", "unbranded"].sample,
                 business_name: Faker::Company.name,
                 address1: Faker::Address.street_address,
                 city: Faker::Address.city,
                 state: Faker::Address.state,
                 zip: Faker::Address.city,
                 station_reg_number: Faker::Code.isbn
                 )
end
