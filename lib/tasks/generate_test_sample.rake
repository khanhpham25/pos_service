namespace :db do
  desc "Generate Sample Data"
  task generate_sample_data: :environment do
    ActiveRecord::Base.transaction do
      puts "Create Role"
        Role.create! [
          {name: "Admin"}
        ]

      puts "Create User"
        User.create! [
          {name: "admin", password: "123123", password_confirmation: "123123", email: "admin@admin.com", address: "Abc 12 AbC", role_id: 1}
        ]

      puts "0.Creating Category"
      Category.create! [
        {name: "Desktop Hardwares"},
        {name: "Laptops"},
        {name: "Gaming Gears"},
        {name: "Network Hardwares"},
        {name: "Storage Devices"},
      ]

      puts "1.Creating Customer Type"
      CustomerType.create! [
        {name: "Individual"},
        {name: "Company"}
      ]

      puts "2. Create attribute"
      Attribute.create!([
        {name: "Color"},
        {name: "Brand"}
      ])

      puts "3. Create provider"
      Provider.create!([
        {name: "IBM", phone: "0934349343", email: "ibm@ibm.com", address: "America", tax_code: "fxs12"},
        {name: "Acer", phone: "0934349343", email: "ibm@ibm.com", address: "America", tax_code: "fxs12"},
        {name: "Dell Shop", phone: "0934349343", email: "ibm@ibm.com", address: "America", tax_code: "fxs12"},
        {name: "Mai Hoang", phone: "0934349343", email: "ibm@ibm.com", address: "America", tax_code: "fxs12"},
        {name: "An Phat", phone: "0934349343", email: "ibm@ibm.com", address: "America", tax_code: "fxs12"},
      ])

      puts "4. Create Customer"
      Customer.create! [
        { name: "Nguyen Van A", address: "So 1 Dai Co Viet",  customer_type_id: 1},
        { name: "Nguyen Van B", address: "So 1 Dai Co Viet",  customer_type_id: 1},
        { name: "Nguyen Van C", address: "So 1 Dai Co Viet",  customer_type_id: 1},
        { name: "Framgia", address: "So 1 Dai Co Viet",  customer_type_id: 2},
        { name: "Bach Khoa", address: "So 1 Dai Co Viet",  customer_type_id: 2},
      ]

      puts "5. Create Product"
      Category.all.each do |category|
        Product.create!([
          {name: "Product A", sale_price: 80, initial_cost: 75, stock_count: 100, category_id: category.id, is_selling: true},
          {name: "Product B", sale_price: 80, initial_cost: 75, stock_count: 100, category_id: category.id, is_selling: true},
          {name: "Product C", sale_price: 80, initial_cost: 75, stock_count: 100, category_id: category.id, is_selling: true},
        ])
      end

      puts "6. Create Payment Method"
      PaymentMethod.create!([
        { name: "Cash"},
        { name: "Credit"},
      ])
    end
  end
end
