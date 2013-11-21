# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# me = Customer.create(name: 'Paul Barry', email: 'mail@paulbarry.com')
# test = Customer.create(name: 'John Doe', email: 'test@example.com')
# Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com')

# muffin = Product.create(name: 'Muffin', price: 2.99)
# smoothie = Product.create(name: 'Smoothie', price: 3.75)
# coffee = Product.create(name: 'Coffee', price: 3.99)

# order = Order.create(customer: me, placed_at: '2013-09-27')
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: me, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: smoothie)

# order = Order.create(customer: test, placed_at: Time.current)
# LineItem.create(order: order, quantity: 1, product: muffin)
# LineItem.create(order: order, quantity: 1, product: coffee)

clothing = Category.create!(name: 'Clothing')
miscellaneous = Category.create!(name: 'Miscellaneous')

categories = Category.all

clothing.products << Product.create!(name: 'Hat', price: 10.99, url: "http://pjb3.github.io/betastore/products/hat.jpg")
miscellaneous.products << Product.create!(name: 'Sticker', price: 1.99, url: "http://pjb3.github.io/betastore/products/sticker.jpg")
clothing.products << Product.create!(name: 'Shirt', price: 11.99, url: "http://pjb3.github.io/betastore/products/shirt.jpg")
clothing.products << Product.create!(name: 'Hoodie', price: 19.99, url: "http://pjb3.github.io/betastore/products/hoodie.jpg")
miscellaneous.products << Product.create!(name: 'iPhone Case', price: 5.99, url: "http://pjb3.github.io/betastore/products/iphone_case.jpg")
miscellaneous.products << Product.create!(name: 'Journal', price: 3.99, url: "http://pjb3.github.io/betastore/products/journal.jpg")

500.times do
  categories.sample.products << Product.create!(
    name: Faker::Commerce.product_name,
    price: (rand(20) + rand(99)/100.0),
  	url: "http://axcelonbp.com/wp-content/uploads/2013/01/Comingsoon.png")
 end