require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Product attributes should not be blank" do
    product = Product.new
    assert product.invalid?
    puts product.errors.inspect
    puts product.errors[:title]

    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "Price should not be negative" do
    product = Product.new
    assert product.invalid?
    product.price = -1
    assert product.invalid?
    assert product.errors[:price].any?
    puts product.errors[:price] 
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price] 

    product.price = 1
    assert product.invalid?
  end

  test "product title must be unique" do
    product = Product.new(title: 'Nokia1', description: 'sample1', image_url: '7apps.jpg', price: 10)
    assert product.invalid?
#    product.save
    assert product.errors[:title].any?
    # product.price = -1
    # assert product.invalid?
    # assert product.errors[:price].any?
    # puts "=============="
    # puts product.errors[:price]
    # assert_equal ["must be greater than or equal to 0.01"], product.errors[:price] 

    # product.price = 1
    # assert product.valid?
  end

  test "product title should not be 10 character" do
    product = Product.new(title: 'Nokia1100', description: 'sample1', image_url: '7apps.jpg', price: 10)
    assert product.invalid?
    assert product.errors[:title].any?
  end

  test "product title should be minimum of 10 characters" do
    product = Product.new(title: 'Nokia110011', description: 'sample1', image_url: '7apps.jpg', price: 10)
    assert product.valid?
  end

end
