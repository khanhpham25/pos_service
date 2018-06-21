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
          {name: "admin", password: "123123", password_confirmation: "123123", email: "admin@admin.com", address: "Abc 12 AbC", role: Role.first}
        ]

      puts "0.Creating Category"
      Category.create! [
        {name: "Desktop Hardwares"},
        {name: "Laptops"},
        {name: "Gaming Gears"},
        {name: "Network Hardwares"},
        {name: "Storage Devices"},
      ]

      puts "1. Creating Customer Type"
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
        {name: "Acer", phone: "0934349343", email: "acer@acer.com", address: "America", tax_code: "fxs12"},
        {name: "Dell Shop", phone: "0934349343", email: "dellshop@dellshop.com", address: "United State", tax_code: "fxs12"},
        {name: "Mai Hoang", phone: "0934349343", email: "maihoang@maihoang.com", address: "Vietnam", tax_code: "fxs12"},
        {name: "An Phat", phone: "0934349343", email: "anphat@anphat.com", address: "Vietnam", tax_code: "fxs12"},
      ])

      puts "4. Create Customer"
      Customer.create! [
        { name: "Nguyen Van A", address: "So 1 Dai Co Viet",  customer_type: CustomerType.first},
        { name: "Nguyen Van B", address: "So 1 Dai Co Viet",  customer_type: CustomerType.first},
        { name: "Nguyen Van C", address: "So 1 Dai Co Viet",  customer_type: CustomerType.first},
        { name: "James", address: "So 1 Dai Co Viet",  customer_type: CustomerType.second},
        { name: "Bach Khoa", address: "So 1 Dai Co Viet",  customer_type: CustomerType.second},
      ]

      puts "5. Create Product"
        Product.create!([
          {name: "VGA MSI 1080Ti", sale_price: 1000, initial_cost: 800, stock_count: 100, category: Category.first, is_selling: true},
          {name: "MSI AMD Firepro", sale_price: 500, initial_cost: 450, stock_count: 100, category: Category.first, is_selling: true},
          {name: "VGA Zotac 1060Ti", sale_price: 600, initial_cost: 500, stock_count: 100, category: Category.first, is_selling: true},
          {name: "VGA MSI 960Ti", sale_price: 250, initial_cost: 200, stock_count: 100, category: Category.first, is_selling: true},
          {name: "VGA MSI 750Ti", sale_price: 150, initial_cost: 120, stock_count: 100, category: Category.first, is_selling: true},
          {name: "VGA ASUS Titanium", sale_price: 600, initial_cost: 550, stock_count: 100, category: Category.first, is_selling: true},
          {name: "Mainboard ASUS WS C621E SAGE", sale_price: 1000, initial_cost: 800, stock_count: 100, category: Category.first, is_selling: true},
          {name: "Mainboard ASUS ROG Rampage", sale_price: 900, initial_cost: 800, stock_count: 100, category: Category.first, is_selling: true},
          {name: "Mainboard MSI Z370", sale_price: 700, initial_cost: 600, stock_count: 100, category: Category.first, is_selling: true},
          {name: "PCIe Samsung 960 PRO 1TB", sale_price: 925, initial_cost: 900, stock_count: 100, category: Category.first, is_selling: true},
          {name: "PCIe Plextor PX-1TM9PeY", sale_price: 552, initial_cost: 520, stock_count: 100, category: Category.first, is_selling: true},
          {name: "RAM Avexir Core 2x16GB DDR4 Bus ", sale_price: 415, initial_cost: 400, stock_count: 100, category: Category.first, is_selling: true},
          {name: "Kit Ram 4 Adata 16GB/3000", sale_price: 300, initial_cost: 275, stock_count: 100, category: Category.first, is_selling: true},
          {name: "Intel Core i9 7920X 2.9Ghz Turbo 4.3", sale_price: 1350, initial_cost: 1275, stock_count: 100, category: Category.first, is_selling: true},
          {name: "CPU Intel Xeon Platinum 8180 2.50GHz", sale_price: 15000, initial_cost: 14500, stock_count: 100, category: Category.first, is_selling: true},
          {name: "MSI Workstation WT73 7RM", sale_price: 7520, initial_cost: 7320, stock_count: 100, category: Category.second, is_selling: true},
          {name: "MSI GAMING GT83 Titan SLI 8RG", sale_price: 7200, initial_cost: 6900, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Acer Gaming Predator Helios 500", sale_price: 4999, initial_cost: 4789, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Acer ACER Gaming Predator Triton", sale_price: 4350, initial_cost: 4000, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Lenovo Thinkpad X1 Yoga Gen 3", sale_price: 2720, initial_cost: 2600, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Dell XPS 15 (9550)", sale_price: 600, initial_cost: 2369, stock_count: 2200, category: Category.second, is_selling: true},
          {name: "ACER Swift 5 Air Edition", sale_price: 1750, initial_cost: 1500, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Dell Inspiron 3579 42NN35D03", sale_price: 1175, initial_cost: 1100, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Asus UX461UA-E1147T", sale_price: 1095, initial_cost: 905, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Laptop Acer Aspire Gaming Nitro 5", sale_price: 925, initial_cost: 900, stock_count: 100, category: Category.second, is_selling: true},
          {name: "LENOVO IdeaPad 520S", sale_price: 675, initial_cost: 625, stock_count: 100, category: Category.second, is_selling: true},
          {name: "HP PRobook 430 G5 2ZD48PA", sale_price: 525, initial_cost: 499, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Dell Inspiron 3567G P63F002-TI34100", sale_price: 475, initial_cost: 400, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Dell Vostro 5468 VTI35018", sale_price: 669, initial_cost: 600, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Acer Aspire A315-51-53ZL", sale_price: 625, initial_cost: 575, stock_count: 100, category: Category.second, is_selling: true},
          {name: "Razer Mamba Hyperflux Wireless", sale_price: 359, initial_cost: 300, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Filco Majestouch Convertible Shibuki", sale_price: 280, initial_cost: 250, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Leopold FC660 Mini Size", sale_price: 272, initial_cost: 260, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Corsair K95 RGB Platinum Mechanical Cherry", sale_price: 225, initial_cost: 200, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Filco Majestouch 2 Candy", sale_price: 215, initial_cost: 199, stock_count: 100, category: Category.third, is_selling: true},
          {name: "CM Storm NovaTouch", sale_price: 195, initial_cost: 170, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Corsair K65 Mechanical Cherry MX", sale_price: 162, initial_cost: 150, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Logitech G903 Lightspeed", sale_price: 155, initial_cost: 150, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Ducky One PBT Brown", sale_price: 127, initial_cost: 100, stock_count: 100, category: Category.third, is_selling: true},
          {name: "Roccat Tyon", sale_price: 625, initial_cost: 100, stock_count: 76, category: Category.third, is_selling: true},
          {name: "Dreytek Vigor Load Balancer", sale_price: 1011, initial_cost: 999, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router ASUS GT-AC5300", sale_price: 499, initial_cost: 400, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router Ubiquiti UniFi AP AC", sale_price: 379, initial_cost: 350, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router Dlink DIR890L Cloud", sale_price: 359, initial_cost: 300, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Switch TPlink 48P", sale_price: 325, initial_cost: 300, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router ASUS RT-AC86U", sale_price: 315, initial_cost: 299, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router ASUS RT-AC68U", sale_price: 299, initial_cost: 270, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Switch Cisco SG95-16", sale_price: 279, initial_cost: 250, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Router ASUS RT- N18U", sale_price: 127, initial_cost: 100, stock_count: 100, category: Category.fourth, is_selling: true},
          {name: "Switch POE Dahua PFS3009", sale_price: 100, initial_cost: 80, stock_count: 76, category: Category.fourth, is_selling: true},
          {name: "WD My Passport Wireless SSD 2TB ", sale_price: 1200, initial_cost: 1099, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD WD MY BOOK DUO 16TB", sale_price: 699, initial_cost: 600, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD WD MY BOOK DUO 12TB", sale_price: 579, initial_cost: 550, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD WD My Cloud EX4100 0TB", sale_price: 499, initial_cost: 400, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "SSD Adata SU800 1TB SATA3", sale_price: 459, initial_cost: 420, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "SSD Samsung 850 PRO 512Gb", sale_price: 289, initial_cost: 250, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD WD My Passport 4TB 2.5", sale_price: 162, initial_cost: 150, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD WD My Passport 3TB 2.5", sale_price: 155, initial_cost: 150, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "HDD Lacie 2TB Porsche Design", sale_price: 127, initial_cost: 100, stock_count: 100, category: Category.fifth, is_selling: true},
          {name: "Card Reader Pisen OTG ", sale_price: 20, initial_cost: 10, stock_count: 76, category: Category.fifth, is_selling: true},
        ])


      puts "6. Create Payment Method"
      PaymentMethod.create!([
        { name: "Cash"},
        { name: "Credit"},
      ])

      puts "7. Create Receipt"
      receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 30.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

      receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 30.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

      receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 32.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 34.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
        {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 35.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 40.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.third, quantity: 2, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.last, quantity: 1, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 2.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 3.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 4.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 5.days, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
      })
      ReceiptDetail.create!  [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
        {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
      ]

      # receipt = Receipt.create!({
      #   creator: User.first, date_time: Time.zone.now - 6.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      # })

      # ReceiptDetail.create![
      #   {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
      #   {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
      #   {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.second.sale_price},
      #   {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
      # ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 7.days, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.third, quantity: 2, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.last, quantity: 1, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 1.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

      ReceiptDetail.create!  [
        {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 4.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",

        })

        ReceiptDetail.create!   [
            {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
            {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 5.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",

        })

        ReceiptDetail.create! [
            {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 7.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",

        })

        ReceiptDetail.create! [
          {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
          {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
          {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
        ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 10.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create!  [
          {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
          {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
          {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.second.sale_price},
          {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 3.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create! [
          {receipt: receipt, product: Product.third, quantity: 2, unit_price: Product.third.sale_price},
          {receipt: receipt, product: Product.last, quantity: 1, unit_price: Product.last.sale_price},
          {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
          {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
        ]
        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.yesterday - 1.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create!    [
            {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
            {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
            {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
            {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.yesterday - 4.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create!  [
            {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
            {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.yesterday - 5.hours, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
        })

        ReceiptDetail.create! [
            {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.yesterday - 7.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create! [
          {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
          {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
          {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
        ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.yesterday - 10.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.yesterday - 3.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.third, quantity: 2, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.last, quantity: 1, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]

            receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 32.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create!  [
            {receipt: receipt, product: Product.first, quantity: 2, unit_price: Product.first.sale_price},
            {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 34.hours, customer_payment: 10000, payment_method: PaymentMethod.second, note: "done",
        })

        ReceiptDetail.create! [
            {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
            {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
            {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.third.sale_price},
          ]

        receipt = Receipt.create!({
          creator: User.first, date_time: Time.zone.now - 26.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
        })

        ReceiptDetail.create! [
          {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
          {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
          {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
          {receipt: receipt, product: Product.first, quantity: 1, unit_price: Product.first.sale_price},
        ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 32.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.last, quantity: 2, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.second, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.third, quantity: 1, unit_price: Product.second.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
      ]

      receipt = Receipt.create!({
        creator: User.first, date_time: Time.zone.now - 27.hours, customer_payment: 10000, payment_method: PaymentMethod.first, note: "done",
      })
      ReceiptDetail.create! [
        {receipt: receipt, product: Product.third, quantity: 2, unit_price: Product.third.sale_price},
        {receipt: receipt, product: Product.last, quantity: 1, unit_price: Product.last.sale_price},
        {receipt: receipt, product: Product.fifth, quantity: 1, unit_price: Product.fifth.sale_price},
        {receipt: receipt, product: Product.fourth, quantity: 1, unit_price: Product.fourth.sale_price},
      ]
    end
  end
end
